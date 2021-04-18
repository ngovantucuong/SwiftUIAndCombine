//
//  DropView.swift
//  Login
//
//  Created by cuongnvt on 3/14/21.
//

import SwiftUI

struct SizePortion: Identifiable, Codable {
    var id = UUID()
    var numberSize: String
}

struct DropView: View {
    var title: String
    @State var isShowContent: Bool = false
    @State var degreesImage: Double = 0.0
    var dataSize: [SizePortion] = [
        SizePortion(numberSize: "S"),
        SizePortion(numberSize: "M"),
        SizePortion(numberSize: "L"),
        SizePortion(numberSize: "XL")
    ]
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .padding(.leading, 32)
                Spacer()
                Image("ic_arrow_down")
                    .frame(width: 30, height: 20)
                    .padding(.trailing, 12)
                    .rotationEffect(.degrees(degreesImage))
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 45)
            .background(Color("BorderColor"))
            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                isShowContent = !isShowContent
                degreesImage = isShowContent ? 180.0 : 0.0
            })
            if isShowContent {
                List {
                    ForEach(dataSize, id: \.id, content: { size in
                        Text(size.numberSize)
                            .frame(alignment: .center)
                    })
                }
            }
        }
        .cornerRadius(5.0)
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView(title: "")
    }
}
