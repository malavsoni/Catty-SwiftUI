//
//  ActiveUsersView.swift
//  ActiveUsersView
//
//  Created by Malav Soni on 30/08/21.
//

import SwiftUI

struct ActiveUsersView: View {
    let users:[User]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.users) { user in
                    UserView(user: user)
                }
            }.padding()
        }.listRowSeparator(.hidden)
    }
}

struct ActiveUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveUsersView(users:[])
    }
}
