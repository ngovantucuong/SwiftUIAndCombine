//
//  CheckboxView.swift
//  Login
//
//  Created by cuongnvt on 1/16/21.
//

import SwiftUI

struct CheckboxView: View {
    @State var isPlaying : Bool = false
    var body: some View {
        HStack(alignment: .center, spacing: 12, content: {
            Button(action: {
                self.isPlaying.toggle()
            }) {
                isPlaying ?
                    Image("ic_check") :
                    Image("ic_uncheck_blue_background")
            }.frame(width: 27, height: 27)
            Text("メールアドレス、パスワードを保存")
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color("BackgroundMainColor"))
    }
}
