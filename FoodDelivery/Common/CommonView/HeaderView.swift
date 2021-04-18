//
//  HeaderView.swift
//  Login
//
//  Created by cuongnvt on 3/6/21.
//

import SwiftUI

struct HeaderView: View {
    @State var title_1: String = ""
    @State var title_2: String = ""
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 17, content: {
            Text(title_1)
                .font(Font.system(size: 30, weight: .medium, design: .default))
            Text(title_2)
                .foregroundColor(.gray)
                .font(Font.system(size: 14, weight: .regular, design: .default))
        })
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
