//
//  CatLoversView.swift
//  CatLoversView
//
//  Created by Malav Soni on 29/08/21.
//

import SwiftUI

struct CatLoversView: View {
    @StateObject private var viewModel:CatLoversViewModel = CatLoversViewModel()
    let color:Color = Color.random
    
    init(viewModel:CatLoversViewModel = CatLoversViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List  {
            Section("Cat Lovers Around You") {
                Group {
                    if self.viewModel.users.isEmpty {
                        LoaderView()
                    } else {
                        ActiveUsersView(users: self.viewModel.users)
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            Section("Interesting Facts About Cats") {
                if self.viewModel.facts.isEmpty {
                    LoaderView()
                } else {
                    ForEach(self.viewModel.facts, id:\.self) { fact in
                        FactCardView(fact:fact.fact)
                    }.listRowBackground(Color.clear)
                }
            }
        }
        .listStyle(.plain)
        .animation(.spring(), value: self.viewModel.users)
        .animation(.spring(), value: self.viewModel.facts)
        .background(Color.white.opacity(0.9))
        .background(color.ignoresSafeArea())
        .onAppear {
            self.viewModel.getInformation()
        }
        .navigationTitle("Welcome Malav!")
    }
}

#if DEBUG
struct CatLoversView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatLoversView(viewModel: CatLoversViewModel(
                catsUseCase: CatsUseCase(
                    userRepository: MockUserRepository(
                        expectedResult:[
                            UserEntity(name: "John Cena"),
                            UserEntity(name: "The Rock")
                        ]
                    ), catFactsRepository: MockCatFactsRepository(
                        expectedResult:[
                            CatFactEntity(fact: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                            CatFactEntity(fact: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
                        ])
                    )
                )
            )
        }
    }
}
#endif
