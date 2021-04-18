//
//  LoadingView.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import SwiftUI

struct ActivityIndicatorView: View {
    @Binding var isPresented:Bool
    var body: some View {
        if isPresented{
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    .scaleEffect(2)
            }
        }
    }
}
