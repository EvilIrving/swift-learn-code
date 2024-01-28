//
//  ContentView.swift
//  food_picker
//
//  Created by Actor on 2024/1/28.
//

import SwiftUI

struct ContentView: View {
    let food = ["汉堡", "沙拉", "披萨", "义大利麵", "鸡腿便当", "刀削麵", "火锅", "牛肉麵", "关东煮"]
    // @State
    @State private var selectedFood: String?
    // body回传一个View
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("今天吃什么?")
                .bold()

            //  if selectedFood != .none {
            if let selectedFood = selectedFood {
                Text(selectedFood)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)
                    .id(selectedFood)

                    // scale 可以 结合其他动画
                    //     .transition(.scale.combined(with: .opacity))

//                 自定义进场和离场动画
                    .transition(.asymmetric(
                        insertion: .opacity
                            .animation(
                                .easeIn(duration: 0.5)
                                    .delay(0.2)),
                        removal: .opacity
                            .animation(
                                .easeOut(duration: 0.4))))
            }

            Button {
                withAnimation {
                    selectedFood = food.shuffled().first!
                }
            } label: {
                Text(selectedFood == .none ? "告诉我" : "换一个")
                    .frame(width: 150)
                    .animation(.none, value: selectedFood)
                    //  两种方式效果一样, transformEffect -> 针对文字用
                    //  .transformEffect(.identity)
                    .transformEffect(.init(translationX: 0, y: 0)) // 设定位置移动, 变相强制动画按照变形去做
            }
            .buttonStyle(.borderedProminent) // Prominent 重要的
            .padding(.bottom, -15)

            Button(role: .destructive) {
                withAnimation {
                    selectedFood = .none
                }
            } label: {
                Text("重置").frame(width: 150)
            }.buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .font(.title)
        .controlSize(.large)
        .buttonBorderShape(.capsule)
        .background(Color(.secondarySystemBackground))
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
    }
}

#Preview {
    ContentView()
}

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

  第二节
     放入图片素材
     新增 View 的方法
     新增图片或 icon
         Image("")
         Image(systemName:"")
     inspector 介绍
     从 inspector 新增调整器
     调整图片大小
         .imageScale(.medium)  只对 系统图标有用
     调整字体
     新增按钮 Button
     @State 管理一个 Value Type 的变化,并且反映到画面上
     view 的间距 spacing 设定 Stack 的 spaceing
     ButtonStyle 调整器
     选择性显示画面
     动画曲线调整器 animation
         value:Equatable, 比较是否有变化发生
     不同的 Button 建立方法
     frame 调整器
     Button role .cancel .destructive
     按钮形状、控制器大小调整器
     调整器可以改变的范围
     设定强调色
     常用的 UIColor
     设定背景色 & frame 限制 Color(UIColor)

  第三节

 决定动画的流程
  .animation(動畫曲線，觀察的值)
  值变化 -> 確認受到影響 -> 确认受到影响的 View(以及是否同一个 View: 身份)

  YES -> 变形动画: 移动(如果不知道怎么变形,还是会淡入淡出(IOS16前直接切换), 一般跟数字有关的 modifier 可以流畅变形)
  No A 画面到 B 画面,或有无转换 -> 转场动画: 默认淡入淡出

 View 的身份
  View是struct，所以需要定義如何判斷view之間的關聯性。 兩個歩驟確認身份：
  先判断結構位置丶再判断ID。
  Hierarchy(结构)

 FoodPicker 中的转场和变形
 处理文字变形动画
 iOS15 的文字变形情况
 transition 转场动画
 explicitly 的动画：withAnimation, 和 implicity 动画区别
    需要明确动画运行的时机
 if 的使用时机
 条件运算子和 if else 的差别
  */
