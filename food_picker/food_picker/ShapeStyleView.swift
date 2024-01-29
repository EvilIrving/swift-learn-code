//
//  ShapeStyleView.swift
//  food_picker
//
//  Created by Actor on 2024/1/29.
//

import SwiftUI
/*
 .linearGradient 是 helper function 帮助调用其他 function
  但背后的机制是基于 形状的,做了一些剪裁和调整,因此 fill 效率更高
 foregroundStyle 可以对任何View使用 fill 只可以用在形状上
 */
struct ShapeStyleView: View {
    var body: some View {
//        形状专属的 modifier
        Circle().fill(.teal)
        Circle().fill(.teal.gradient)
        Circle().fill(.image(.init("dinner"), scale: 0.2))
        Circle().fill(.linearGradient(colors: [.teal, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
        Text("Hello").font(.system(size:100)).foregroundStyle(AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center))
    }
}

#Preview {
    ShapeStyleView()
}
