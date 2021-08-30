//
//  UserPreviewView.swift
//  UserPreviewView
//
//  Created by Malav Soni on 29/08/21.
//

import SwiftUI

struct UserView: View {
    let user:User
    
    var body: some View {
        ZStack {
            Text(user.initials)
                .font(.largeTitle)
                .foregroundColor(.white)
            
        }
        .frame(width: 100, height: 100, alignment: .center)
        .background(Color.black.opacity(0.2))
        .background(Color.random)
        .clipShape(Circle())
        .shadow(radius: 5.0)
    }
}

struct UserPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(name: "Malav Soni"))
    }
}
