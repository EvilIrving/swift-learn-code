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
    @State private var isShowTip = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group{
                    if selectedFood == .none {
                        Image("dinner")
                            .resizable().aspectRatio(contentMode: .fit)
                        
                    } else {
                        Text(selectedFood!.image).font(.system(size: 200))
                            .lineLimit(1).minimumScaleFactor(0.1)
                        
                    }
                }.frame(height: 250)
                
                Text("今天吃什么？").bold()
                
                if selectedFood != .none {
                    HStack{
                        Text(selectedFood!.name)
                            .font(.largeTitle).bold().foregroundColor(.green)
                            .id(selectedFood!.name)
                            .transition(.asymmetric(
                                insertion:
                                        .opacity.animation(.easeIn(duration: 0.5).delay(0.2)),
                                removal:
                                        .opacity.animation(.easeOut(duration: 0.4))))
                            .transition(.scale.combined(with: .slide))
                        //                    .transformEffect(.identity)
                        
                        Button{
                            isShowTip.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill").foregroundColor(Color.secondary)
                        }.buttonStyle(.plain)
                        
                       
                         
                    }
                    
                    Text("热量 \(selectedFood!.calorie,specifier: "%.0f") 大卡")
                        .font(.headline)
                    
                    VStack {
                        if isShowTip {
                            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                                GridRow {
                                    Text("蛋白质").font(.headline)
                                    Text("脂肪").font(.headline)
                                    Text("碳水").font(.headline)
                                }.frame(minWidth: 60)
                                
                                Divider().gridCellUnsizedAxes(.horizontal)
                                    .padding(.horizontal,-10)
                                
                                GridRow {
                                    Text("\(selectedFood!.protein.formatted()) g").font(.headline)
                                    Text("\(selectedFood!.fat.formatted()) g").font(.headline)
                                    Text("\(selectedFood!.carb.formatted()) g").font(.headline)
                                }
                                
                            }
                            .font(.title3)
                            .padding(.horizontal)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(.systemBackground)))
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .border(.green)
                    .clipped()
                }
                //                else {
                //                    EmptyView()
                //                }
                
                Spacer()
                //                    .frame(height:150)
                //                    .layoutPriority(1)
                
                //            selectedFood != .none ? Color.pink : Color.black
                //            if selectedFood != .none {
                //                Color.pink
                //            }else{
                //                Color.black
                //            }
                
                Button {
                    //                withAnimation{
                    print("🐄🍜".count)
                    selectedFood = foods.shuffled().filter { $0 != selectedFood }.first
                    //                }
                } label: {
                    Text(selectedFood == .none ?"告诉我" : "换一个")
                        .font(.title2)
                        .frame(width: 200)
                        .transformEffect(.identity)
                    //                    .transformEffect(.init(translationX: 0, y: 0))
                }
                .padding(.bottom, -5)
                .buttonStyle(.borderedProminent)
                //            .controlSize(.large)
                
                Button {
                    //                withAnimation{
                    isShowTip = false
                    selectedFood = .none
                    //                }
                } label: {
                    Text("重置")
                        .font(.title2)
                        .frame(width: 200)
                      
                        .transformEffect(.identity)
                }
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: UIScreen.main.bounds.height - 100)
            .font(.title)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .animation(.spring(dampingFraction: 0.57), value: isShowTip)
//            .animation(.easeIn, value: isShowTip)
            .animation(.easeInOut(duration: 0.6), value: selectedFood)
        }.background(Color(.secondarySystemBackground))
        
    }
}

extension ContentView {
    init(selectFood:Food) {
        _selectedFood = .init(wrappedValue: selectFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectFood: .examples.first!)
    }
}
