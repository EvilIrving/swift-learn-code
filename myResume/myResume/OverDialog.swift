//
//  OverDialog.swift
//  myResume
//
//  Created by Actor on 2023/10/16.
//

import SwiftUI

struct OverDialog: View {
    @Binding var isShowing: Bool
    var body: some View {
        let me = Resume.shared
        VStack {
            HStack {
                Image(systemName: "phone")
                    .resizable().aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10)).foregroundColor(.brown)
                    .padding(10)
                    .onTapGesture {
                        openUrl(me.phoneUrl)
                    }

                ForEach(me.socialMedia, id: \.name) { social in
                    Image(social.name.lowercased(), label: Text(social.name))
                        .resizable().aspectRatio(contentMode: .fit)
                        .padding(10)
                        .onTapGesture {
                            openUrl(social.url)
                        }
                }
            }.frame(maxWidth: .infinity, alignment: .center)

            Text("取消").font(.title2).bold()
                .foregroundColor(.secondary)
                .onTapGesture {
                    isShowing = false
                }

        }.padding()
            .background(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
            .padding()
    }

    func openUrl(_ url: String) {
        if UIApplication.shared.canOpenURL(URL(string: url)!) {
            UIApplication.shared.open(URL(string: url)!)
            return
        }
        print("cant")
    }
}

struct OverDialog_Previews: PreviewProvider {
    static var previews: some View {
        OverDialog(isShowing: .constant(true)).padding().background(.yellow)
    }
}
