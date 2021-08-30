//
//  CatLoversView.swift
//  CatLoversView
//
//  Created by Malav Soni on 29/08/21.
//

import SwiftUI

struct CatLoversView: View {
    @StateObject private var viewModel:CatLoversViewModel
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
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.viewModel.users) { user in
                                    UserView(user: user)
                                }
                            }.padding()
                        }.listRowSeparator(.hidden)
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
        .task {
            self.viewModel.fetchInfo()
        }
        .navigationTitle("Welcome Malav!")
    }
}

struct CatLoversView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatLoversView(viewModel: CatLoversViewModel(
                userRepository:
                    MockUserRepository(
                        expectedResult:[
                            User(name: "John Cena"),
                            User(name: "The Rock")
                        ]
                    ),
                catFactsRepository:
                    MockCatFactsRepository(
                        expectedResult:[
                            CatFact(fact: "This is just a test fact"),
                            CatFact(fact: "This is just a test fact")
                        ]
                    )
                )
            )
        }
    }
}
