//
//  MainView.swift
//  Catty
//
//  Created by Malav Soni on 03/10/21.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelection:CATabBarItem = .home
    var body: some View {
        CATabView(selection: $tabSelection) {
            NavigationView {
                CatLoversView()
            }
            .tabBarItem(item: .home, selection: $tabSelection)
            
            SecondView()
                .tabBarItem(item: .profile, selection: $tabSelection)
                .onAppear {
                    
                }
        }
    }
}

struct SecondView:View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
            print("On Appear : Red Color")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
