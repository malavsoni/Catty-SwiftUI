//
//  LoaderView.swift
//  LoaderView
//
//  Created by Malav Soni on 29/08/21.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        HStack(spacing:20) {
            Text("Loading")
            ProgressView()
        }
        .frame(maxWidth:.infinity, alignment:.center)
        .frame(height:100)
        .listRowBackground(Color.clear)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
