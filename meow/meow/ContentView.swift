//
//  ContentView.swift
//  meow
//
//  Created by Actor on 2024/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isRecording = false
    @State private var selectedSound: CatSound?

    var body: some View {
        NavigationView {
            ZStack {
                // 主页内容
                List {
                    ForEach(catSounds, id: \.id) { sound in
                        HStack {
                            if let image = sound.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }

                            Text(sound.name)
//                                .frame(alignment: .trailing)
                        }
//                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .onTapGesture {
                            // 播放声音的逻辑
                            print("Playing sound: \(sound.name)")
                        }
                        .contextMenu {
                            // 长按时显示的菜单
                            Button("Edit") {
                                self.selectedSound = sound
                                // 导航到编辑页面
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                // 悬浮的录制按钮
                if !isRecording {
                    Button(action: {
                        // 开始录制的逻辑
                        self.isRecording = true
                        // 这里您需要实现录制的逻辑
                    }) {
                        Image(systemName: "record.circle")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding()
                            .position(x: UIScreen.main.bounds.width - 80, y: 40) // 悬浮在右下角
                    }
                }
            }
            .navigationBarTitle("Cat Sounds", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                // 导航到设置页面
            }) {
                Image(systemName: "gear")
            })
        }
    }
}

struct CatSound: Identifiable {
    let id = UUID()
    let name: String
    let emotion: String
    let image: Image?
}

let catSounds = [
    CatSound(name: "Purr", emotion: "Happy", image: Image(systemName: "heart.fill")),
    CatSound(name: "Meow", emotion: "Happy", image: Image(systemName: "hand.thumbsup.fill")),
    CatSound(name: "Hiss", emotion: "Angry", image: Image(systemName: "exclamationmark.triangle.fill")),
    CatSound(name: "Growl", emotion: "Angry", image: Image(systemName: "bolt.fill")),
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
// }

#Preview {
    ContentView()
}
