//
//  BaseLocalService.swift
//  BaseLocalService
//
//  Created by Malav Soni on 15/09/21.
//

import Foundation
import CoreData

protocol CoreDataStackProtocol:AnyObject {
    var context:NSManagedObjectContext { get }
    var persistentContainer: NSPersistentContainer { get }
    func saveContext ()
}

class CoreDataStack: CoreDataStackProtocol {
    
    static let shared = CoreDataStack()
    
    private let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "catty")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    // MARK: - Core Data stack
    
    var persistentContainer: NSPersistentContainer {
        self.container
    }
    
    var context: NSManagedObjectContext {
        self.container.viewContext
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

enum LocalServiceError:Error {
    case unimplementedError
}

protocol ConvertableToModel {
    associatedtype Model:NSManagedObject
    
    @discardableResult
    func toModel(context:NSManagedObjectContext) -> Model
}

class BaseLocalService: SaveableService {
    let coreDataStack:CoreDataStackProtocol
    
    init(coreDataStack:CoreDataStackProtocol = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }
    
    func saveAll<T:ConvertableToModel>(entities:[T]) async throws {
        try await self.coreDataStack.persistentContainer.performBackgroundTask({ context in
            _ = entities.map { model in
                model.toModel(context: context)
            }
            try context.save()
        })
    }
    
    func save<T:ConvertableToModel>(entity:T) async throws {
        try await self.coreDataStack.persistentContainer.performBackgroundTask({ context in
            entity.toModel(context: context)
            try context.save()
        })
    }
    
    func fetchAll<T:Decodable & NSManagedObject>() async throws -> [T] {
        let results:[T] = try await self.coreDataStack.persistentContainer.performBackgroundTask { context in
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String.init(describing: T.self))
            if let records:[T] = try context.fetch(request) as? [T] {
                return records
            }
            return []
        }
        return results.lazy
            .compactMap { $0.objectID }
            .compactMap { self.coreDataStack.context.object(with:$0) as? T }
    }
    
    func fetch<T:Decodable>(byKey key:String, value:String) async throws -> T {
        try await self.coreDataStack.persistentContainer.performBackgroundTask { context in
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String.init(describing: T.self))
            request.predicate = NSPredicate(format: "\(key) = %@", value)
            if let records:[T] = try self.coreDataStack.context.fetch(request) as? [T] {
                return records[0]
            }
            throw LocalServiceError.unimplementedError
        }
    }
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
