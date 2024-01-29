//
//  food_pickerApp.swift
//  food_picker
//
//  Created by Actor on 2024/1/28.
//

import SwiftUI

// 代表 app 的进入点 必须 conform App,body 属性中设计 Scene的类型
// App -> Scene -> View
/*
 ContentView & 预览画面
 专案和 target 设定
 @main & App & Scene
 assets & preview content
 iOS 最低版本选择
 */

@main
struct food_pickerApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ListView()
        }
    }
}
