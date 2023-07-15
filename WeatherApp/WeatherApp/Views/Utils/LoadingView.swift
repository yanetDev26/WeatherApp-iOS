//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Yanet Rodriguez on 13/07/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(
                tint: Color("Orange")
            ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Teal"))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
