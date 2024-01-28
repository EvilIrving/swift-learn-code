//
//  ContentView.swift
//  food_picker
//
//  Created by Actor on 2024/1/28.
//

import SwiftUI
/*
 View
 ·在body属性中描述畫面長什麽樣子。
 ・body的類型必須遵循View Protocol。
 ·從内建的View 開始设計计。

 写一个 View
 1. 有哪些 View 可以用 View
 2. View可以如何改变 Modifer
 3. 如何组合和排列多个View Layout
 
 show library Command Shift L 查看有哪些 View Layout 以及Api 文件
 第二个 Tab 是 Modifer
 */
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
