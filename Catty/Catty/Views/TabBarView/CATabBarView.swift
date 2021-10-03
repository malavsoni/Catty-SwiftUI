    //
    //  CATabBarView.swift
    //  Catty
    //
    //  Created by Malav Soni on 03/10/21.
    //

import SwiftUI

enum CATabBarItem:Int, Hashable{
    
    case home,profile,settings
    
    var name:String {
        switch self {
            case .home:
                return "Home"
            case .profile:
                return "Profile"
            case .settings:
                return "Settings"
        }
    }
    
    var iconName:String {
        switch self {
            case .home:
                return "house"
            case .profile:
                return "person.crop.circle"
            case .settings:
                return "gear"
        }
    }
    
    var color:Color {
        switch self {
            case .home:
                return Color.purple
            case .profile:
                return Color.green
            case .settings:
                return Color.blue
        }
    }
}

struct CATabBarView: View {
    
    @Binding var selection:CATabBarItem
    let tabBarItems:[CATabBarItem]
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(self.tabBarItems, id:\.self) { item in
                Button(action: {
                    withAnimation {
                        self.selection = item
                    }
                }, label:{
                    VStack(spacing: 0.0) {
                        Image(systemName: item.iconName)
                            .font(selection == item ? Font.headline : Font.footnote)
                        Text(item.name)
                            .font(Font.footnote)
                    }
                    
                    .foregroundColor(selection == item ? item.color : Color.gray)
                        .frame(maxWidth:.infinity)
                        .padding(.vertical, 8.0)
                        .if(selection == item, transform: { view in
                            view.background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(item.color.opacity(0.25))
                                    .matchedGeometryEffect(id: "tabBar_background", in: namespace)
                            )
                        })
                        .padding(.top)
                })
                
            }
        }.background(Color.white.ignoresSafeArea(.all, edges: .bottom))
    }
}

struct CATabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CATabBarView(selection:.constant(.home), tabBarItems: [
            .home,
            .profile,
            .settings
        ]).previewLayout(.sizeThatFits)
    }
}
