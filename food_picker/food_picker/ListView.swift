//
//  ListView.swift
//  food_picker
//
//  Created by Actor on 2024/1/29.
//

import SwiftUI

struct ListView: View {
    /// 环境变量
    @Environment(\.editMode) var editMode
    @Environment(\.dynamicTypeSize) var textSize

    @State var selectedFoods = Set<Food.ID>()
    @State var showInfo: Bool = false
    @State var foods = Food.examples

    var isEditing: Bool { editMode?.wrappedValue == .active }

    var body: some View {
        VStack(alignment: .leading) {
            titleBar
            // (存取 binding )
            List($foods, editActions: .all, selection: $selectedFoods) { $food in Text(food.name) }
                .listStyle(.plain)
                .padding(.horizontal)
        }
        .background(.groupBg)
        .safeAreaInset(edge: .bottom, content: buildFloatButton)
        .sheet(isPresented: .constant(true), content: {
            let food: Food = foods[4]
           
            let shouldUseVstack = textSize.isAccessibilitySize || food.image.count > 1

            let layout = shouldUseVstack ? AnyLayout(VStackLayout(spacing: 30)) : AnyLayout(HStackLayout(spacing: 30))

            layout {
                Text("\(textSize ?"true" : "false")")
                Text(food.image)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)

                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    buildFoodTextView(text: "热量", value: food.$calorie)
                    buildFoodTextView(text: "蛋白质", value: food.$protein)
                    buildFoodTextView(text: "脂肪", value: food.$fat)
                    buildFoodTextView(text: "碳水", value: food.$carb)
                }
            }
            .padding()
            .presentationDetents([.medium])
            .environment(\.dynamicTypeSize, .accessibility3)
        })
    }
}

private extension ListView {
    var titleBar: some View {
        HStack {
            Label(
                title: { Text("食物清单") },
                icon: { Image(systemName: "fork.knife") }
            )
            .frame(maxWidth: .infinity, alignment: .leading)

            EditButton().buttonStyle(.bordered)
            //                    .environment(\.locale,.init(identifier: "zh-CN"))
        }
        .font(.largeTitle.bold())
        .foregroundColor(.accentColor)
        .padding()
    }

    var addButton: some View {
        Button(action: {
        }, label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 50))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, Color.accentColor.gradient)
        })
        .padding(.trailing)
    }

    var removeButton: some View {
        Button {
            withAnimation {
                foods = foods.filter { !selectedFoods.contains($0.id) }
            }
        } label: {
            Text("删除已选").font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .center)
        }

        .mainButtonStyle(shape: .roundedRectangle(radius: 8))
        .padding(.horizontal, 60)
    }

    func buildFloatButton() -> some View {
        ZStack {
            removeButton
                .transition(.move(edge: .leading).combined(with: .opacity).animation(.easeInOut))
                .opacity(isEditing ? 1 : 0)
                .id(isEditing)
            HStack {
                Spacer()
                addButton
                    .scaleEffect(isEditing ? 0 : 1)
                    //                        .transition(.scale.combined(with: .opacity).animation(.easeInOut))
                    .opacity(isEditing ? 0 : 1)
                    .animation(.easeInOut, value: isEditing)
                //                        .id(isEditing)
            }
        }
        //            if isEditing {
        //                removeButton
        //            } else {
        //                addButton
        //            }
    }

//    @ViewBuilder
    func buildFoodTextView(text: String, value: String) -> some View {
        GridRow {
            Text(text).gridCellAnchor(.leading)
            Text("\(value)").gridCellAnchor(.trailing)
        }
    }
}

#Preview {
    ListView()
//        .environment(\.editMode, .constant(.active))
}

/*

 > UUID
 > 用 List 建立食物清單
 > Label
 > EditButton
 > 懸浮按鈕 FloatingButton
 > SafeAreaInset
 > 建立刪除按鈕
 > 調整按鈕轉場動畫
 > Sheet
 > AnyLayout
 > 程式碼部分

 */
