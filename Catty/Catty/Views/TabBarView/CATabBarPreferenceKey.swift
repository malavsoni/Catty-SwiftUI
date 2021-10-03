//
//  CATabBarPreferenceKey.swift
//  Catty
//
//  Created by Malav Soni on 03/10/21.
//

import Foundation
import SwiftUI

struct CATabBarPreferenceKey:PreferenceKey {
    static var defaultValue: [CATabBarItem] = []
    
    static func reduce(value: inout [CATabBarItem], nextValue: () -> [CATabBarItem]) {
        value += nextValue()
    }
}

struct CATabBarItemViewModifier:ViewModifier {
    
    let tab:CATabBarItem
    @Binding var selection:CATabBarItem
    
    func body(content: Content) -> some View {
        if selection == tab {
            content
                .opacity(1)
                .preference(key: CATabBarPreferenceKey.self, value: [tab])
        } else {
            Text("")
                .opacity(0)
                .preference(key: CATabBarPreferenceKey.self, value: [tab])
        }
    }
}

extension View {
    func tabBarItem(item:CATabBarItem, selection:Binding<CATabBarItem>) -> some View {
        self
            .modifier(CATabBarItemViewModifier(tab: item, selection: selection))
            
    }
}
