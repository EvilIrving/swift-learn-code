//
//  ContentView.swift
//  FoodPicker
//
//  Created by Actor on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    let foods = Food.examples
    var food: [String] = ["蟹黄锅巴", "咸蛋黄锅巴", "红油抄手", "糖醋排骨", "麻辣手撕包菜", "辣炒包菜", "盐水鹅", "苋菜", "凉拌菠菜", "肉圆", "凉拌黄瓜", "鸡米花", "砂糖橘", "面条", "炒蛋", "土豆炖牛肉", "胡辣汤", "蛋炒饭", "酸菜鱼", "阳春面", "青菜肉粥", "咸鸭蛋", "莴苣", "萝卜烧肉", "芦笋炒肉", "羊肉汤"]
    @State private var selectedFood: Food?
    var body: some View {
        VStack(spacing: 30) {
//            Image("dinner")
//                .resizable().aspectRatio(contentMode: .fit)
            
            if selectedFood == .none {
                Image("dinner")
                    .resizable().aspectRatio(contentMode: .fit)
            } else {
                Image(selectedFood!.image)
                Image
//                Text(selectedFood!.image).font(.largeTitle)
            }
         
            
            Text("今天吃什么？").bold()
            
            if selectedFood != .none {
                Text(selectedFood!.name)
                    .font(.largeTitle).bold().foregroundColor(.green)
                    .id(selectedFood!.name)
//                    .transition(.asymmetric(
//                        insertion:
//                        .opacity.animation(.easeIn(duration: 0.5).delay(0.2)),
//                        removal:
//                        .opacity.animation(.easeOut(duration: 0.4))))
//                    .transition(.scale.combined(with: .slide))
                    .transformEffect(.identity)
            } else {
                EmptyView()
            }
            
            
//            selectedFood != .none ? Color.pink : Color.black
//            if selectedFood != .none {
//                Color.pink
//            }else{
//                Color.black
//            }
            
            Button {
//                withAnimation{
                    selectedFood = foods.shuffled().filter { $0 != selectedFood }.first
//                }
            } label: {
                Text(selectedFood == .none ?"告诉我" : "换一个")
                    .font(.title2).padding(.vertical, 6)
                    .frame(width: 200)
                    .animation(.none, value: selectedFood)
                    .transformEffect(.identity)
//                    .transformEffect(.init(translationX: 0, y: 0))
            }
            .padding(.bottom, -15)
            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
            
            Button {
//                withAnimation{
                    selectedFood = .none
//                }
            } label: {
                Text("重置")
                    .font(.title2).padding(.vertical, 6)
                    .frame(width: 200)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
