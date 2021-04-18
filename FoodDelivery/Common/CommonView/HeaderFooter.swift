//
//  HeaderFooter.swift
//  Login
//
//  Created by cuongnvt on 3/6/21.
//

import SwiftUI

struct HeaderFooter: View {
    @State var leftTitle: String = ""
    @State var righttTitle: String = ""
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4, content: {
            Text(leftTitle)
                .foregroundColor(.gray)
                .font(Font.system(size: 14, weight: .bold, design: .default))
            Text(righttTitle)
                .foregroundColor(Color("OrganceColor"))
                .font(Font.system(size: 14, weight: .bold, design: .default))
        })
        .padding(.bottom, 26)
    }
}

struct HeaderFooter_Previews: PreviewProvider {
    static var previews: some View {
        HeaderFooter()
    }
}
