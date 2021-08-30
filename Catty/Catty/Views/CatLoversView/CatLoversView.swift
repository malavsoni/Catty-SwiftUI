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
        .onAppear {
            self.viewModel.fetchInfo()
        }
        .navigationTitle("Welcome Malav!")
    }
}

struct CatLoversView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatLoversView()
        }
    }
}
