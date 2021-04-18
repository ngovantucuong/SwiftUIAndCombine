//
//  Header.swift
//  Login
//
//  Created by cuongnvt on 1/17/21.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("BorderColor"))
                .frame(height: 60)
            Text("ログイン")
        }
    }
}
