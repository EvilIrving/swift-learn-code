//
//  ContentView.swift
//  food_picker
//
//  Created by Actor on 2024/1/28.
//

import SwiftUI
struct ContentView: View {
    // @State
    @State private var selectedFood: Food?
    @State private var showInfo = false

    let food = Food.examples

    // body回传一个View
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                foodImage

                Text("今天吃什么?").bold()

                selectedFoodInfoView

                // Color.clear // Color 是 expanding 的
                Spacer().layoutPriority(1) // 排版优先级

                selectFoodButton
                resetButton
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 100) // UIScreen().bounds 设备屏幕尺寸
            .font(.title)
            .mainButtonStyle()
            // 不要普通的动画, 要 Q 弹
            .animation(.mySpring, value: showInfo)
            .animation(.myEase, value: selectedFood)
        }.background(.bg2)
    }
}

// MARK: - SubViews

private extension ContentView {
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    // 最小缩放因数
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }.frame(height: 250)
    }

    var foodNameView: some View {
        HStack {
            Text(selectedFood!.name)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.green)
                .id(selectedFood!.name)
                // scale 可以 结合其他动画
                //     .transition(.scale.combined(with: .opacity))

                //  自定义进场和离场动画
                .transition(.delayInsertionOpacity)

            Button {
                showInfo.toggle()
            } label: {
                Image(systemName: "info.circle.fill").foregroundColor(.secondary)
            }.buttonStyle(.plain)
        }
    }

    var foodDetailView: some View {
        // 限制动画显示时 跳过 热量大卡 的文字
        // 增加一个 VStack
        VStack {
            if showInfo {
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }.frame(minWidth: 60)
                    //                                .gridCellAnchor(.trailing)

                    Divider().gridCellUnsizedAxes(.horizontal).padding(.horizontal, -10) // 垂直或水平是根据所处位置判断得出

                    GridRow {
                        // 数字的格式化
                        // 使用方法 buildNunberText 返回格式化好的文字
                        // 在 Food 定义新的String计算属性 如 proteinString 返回 带单位的值
                        // 使用 PropertyWrapper 的投射属性
                        Text("\(selectedFood!.$protein)")
                        Text("\(selectedFood!.$fat)")
                        Text("\(selectedFood!.$carb)")
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding()
                .roundedRectBackground()

                // ipad上淡入淡出的效果不满意, 想要更有存在感
                .transition(.moveUpWithOpacity)

                //                        HStack {
                //                            VStack(spacing: 12) {
                //                                Text("蛋白质").font(.title2)
                //                                Text("\(selectedFood.protein.formatted(.number))g")
                //                            }
                //
                //                            Divider().frame(width: 1).padding(.horizontal)
                //
                //                            VStack(spacing: 12) {
                //                                Text("脂肪").font(.title2)
                //                                Text("\(selectedFood.fat.formatted(.number))g")
                //                            }
                //
                //                            Divider().frame(width: 1).padding(.horizontal)
                //
                //                            VStack(spacing: 12) {
                //                                Text("碳水").font(.title2)
                //                                Text("\(selectedFood.carb.formatted(.number))g")
                //                            }
                //                        }
                //                        .padding(.horizontal)
                //                        .padding()
                //                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
            }
        }
        .frame(maxWidth: .infinity)
        .clipped() // 裁剪空间
//                    .border(.black)
    }

    // ViewBuilder作用
    @ViewBuilder
    var selectedFoodInfoView: some View {
        //     不可以用 guard let, ViewBuilder 不支援 Control Flow
        //            if selectedFood != .none {
        if let selectedFood = selectedFood {
            foodNameView
            Text("热量 \(selectedFood.$calorie)")
            foodDetailView
        }
    }

    var selectFoodButton: some View {
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
    }

    var resetButton: some View {
        Button(role: .destructive) {
            withAnimation {
                selectedFood = .none
                showInfo = false
            }
        } label: {
            Text("重置").frame(width: 150)
        }.buttonStyle(.bordered)
    }
}

extension ContentView {
    init(selectedFood: Food) {
        // State 的真面目,底线版本的值就是 上面 selectedFood 的默认值,没有就是 nil
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

// extension PreviewDevice {
//    static let iPad = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)")
//    static let SE = PreviewDevice(rawValue: "iPhone SE (3rd generation)")
// }

#Preview {
    ContentView(selectedFood: .examples.first!)
//    ContentView(selectedFood: .examples.first!)
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

   1-5
  什麽是 some View？
  調整器(Modifier)的重点整理
   ·有的只對套用的那一個View做改變，有的會改變所有包含在裡面的View。
   ·有些调整器會疊加，有些只套用第一個（不會被覆蓋）。
   ·大部分的调整器都是在View的extension中，使用後會回传一個新的View。
   ·调整器的位置很重要。

  SwiftUI 是如何排版的？
   1.上層畫面告诉下層畫面自己有多少空間，並询問他們需要多少空間。
   2.下層畫面回應自己想要的大小。它可以選擇任何大小，不一定要配合上層提供的大小决定。
   3.上層根據收集到的所有大小，根據自己的排版規则來决定他們的位置在哪。

  View 的大小类型
          Hugging             Neutral                     Expanding
   知道自己需要的大小是多少   根據自己的子View决定         想要盡可能佔滿 所有空間
           Text               VStack                      Color
                              Button                  Image.resizable
   x 轴和 y 轴的大小类型可以不一样, 比如:toggle的  x 轴是Expanding, y 轴是Neutral

  动态字体大小 Dynamic type
      如何是自定Size就不能直接使用动态大小 或 搭配 @ScaleMetric 的 PropertyWrapper 使用
  Human Interface Guildlines
  1x 2x 3x 图片：Scale Factor

    2-1

    资料修改
    挑战：更换图片
    实作更换图片
    调整字体大小 & 行数
    固定画面
    Group

    2-2: 重点: 学会推断排版的规则,问:为什么会产生这样的排版结果, 才能写出高效的代码

    预览画面调整 & 设定 State 啟动值
    新增 icon
    新增营养资讯画面
    检查不同尺寸装置
    ScrollView 对排版的影响
    layoutPriority 排版优先度
    Grid 格状排版
    使用 SwiftUI 的心态(?)
    设定显示营养资讯的按钮
    有弹力的动画 spring

  2-3 refactor
     调整属性
         showInfo -> shouldShowInfo
     整理 View 的架构
         body 中的 view 放置解释画面有哪些部分, 每个部分都可以单独抽出去
     使用 ViewBuilder
     整理 struct
         使用 extension 封装动画 颜色 方法 圆角

     整理调整器
         分成不同文件
     设计后缀调整
         使用 PropertyWrapper

  2-4 介绍有哪些 ShapeStyle、画面的图层、图层对动画的影响以及 ViewBuilder 的限制

 ShapeStyle 介绍

 Leading & Trailing 的意思
     文字开始和结束的方向

 从 ShapeStyle 直接存取顏色
     extension
 强制画面使用最理想大小
  .fixedSize
 画面的图层
 ZStack
 ZStack 中的动画限制:
 ViewBuilder 的限制: 最多 10 个,超过 10 个可以包装起来
 Lazy View: Lazy 版本的 View 只有用户滑到的时候才会加载

  3-1
  使用 ForEach 和 List，搭配 Collection 来动态地产生多个画面的方法以及相关的调整器（View 的迴圈）

  ForEach 根据 ID 动态产生和管理画面的 View
  Data
  Random

 ForEach 介绍
 List 介绍
 移动、删除
 选择

  3-2 属性包装
  属性包装：State、Binding、Environment。这三个属性包装都和资料传递有关，是 SwiftUI 中 Value Type 资料传递与画面更新的基础。

  Property Wrapper 複习
  State 介绍
  Binding 介绍
  State & Binding 组合应用
  Environment 介绍
    ✨ 影片中提到的资讯

  */
