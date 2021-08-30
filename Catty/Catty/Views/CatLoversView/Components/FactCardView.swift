//
//  FactCardView.swift
//  FactCardView
//
//  Created by Malav Soni on 30/08/21.
//

import SwiftUI

struct FactCardView: View {
    let fact:String
    var body: some View {
        let color = Color.random
        Text(fact)
            .foregroundColor(Color.black.opacity(0.5))
            .font(.system(size: 16.0, weight: .medium, design: .rounded))
            .padding()
            .frame(maxWidth:.infinity, alignment:.leading)
            .background(Color.white.opacity(0.8))
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: RoundedCornerStyle.continuous))
            .shadow(color: color.opacity(0.7), radius: 5, x: 0, y: 0)
            .listRowSeparator(.hidden)
            .padding(.bottom)
    }
}

struct FactCardView_Previews: PreviewProvider {
    static var previews: some View {
        FactCardView(fact: "Hello")
    }
}
