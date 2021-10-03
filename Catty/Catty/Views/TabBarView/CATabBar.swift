//
//  CATabBar.swift
//  Catty
//
//  Created by Malav Soni on 03/10/21.
//

import SwiftUI

struct CATabView<Content:View>:View {
    
    @Binding var selection:CATabBarItem
    @State private var tabs:[CATabBarItem] = []
    let content:Content
    
    init(selection: Binding<CATabBarItem>, @ViewBuilder content:() -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                content
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            CATabBarView(
                selection: self.$selection,
                tabBarItems: self.tabs
            ).padding(.horizontal)
        }
        .onPreferenceChange(CATabBarPreferenceKey.self) { newValue in
            self.tabs = newValue
        }
    }
}

struct CATabBar_Previews: PreviewProvider {
    static var previews: some View {
        CATabView(selection: Binding<CATabBarItem>.constant(.home)) {
            Text("Hello")
                .tabBarItem(item: .home, selection: .constant(.home))
        }
    }
}
