//
//  ContentView.swift
//  meow
//
//  Created by Actor on 2024/2/26.
//

import AVFoundation
import SwiftUI

class SoundPlayer: ObservableObject {
    var player: AVAudioPlayer?

    func playSound(sound: Sound) {
        do {
            player = try AVAudioPlayer(contentsOf: sound.audioFile!)
            player?.play()
        } catch {
            // Handle error
            print("Couldn't load sound file")
        }
    }

    func stopSound() {
        player?.stop()
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            .background(configuration.isPressed ? Color.gray.opacity(0.5) : .white)
            .foregroundColor(.black)
            .cornerRadius(8)
    }
}

struct ContentView: View {
    @State private var isRecording = false
    @State private var isPlaying = false
    @State private var progressBarWidth: CGFloat = 0
    @State private var sounds = Sound.sounds
    @State private var selectedSound: Sound?
    @ObservedObject var soundPlayer = SoundPlayer()

    var body: some View {
        VStack {
            HStack {
                Label(
                    title: { Text("Cat").font(.title3) },
                    icon: { Image(systemName: "cat") }
                ).frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: "gear")
            }.padding(.horizontal, 36)

            List($sounds) { $sound in

                Button {
                    if sound.isPlaying {
                        // 停止音频
                        self.soundPlayer.stopSound()
                    } else {
                        // 播放音频
                        self.soundPlayer.playSound(sound: sound)
                    }
                    // 切换音频的播放状态
                    sound.isPlaying.toggle()
                } label: {
                    HStack {
                        Text(sound.name)
                        Spacer()
                        Text(sound.image)
                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                    .background(
                        // 根据isPlaying的值设置背景颜色
                        sound.isPlaying ? Color.green : Color.clear
                    )
                    .overlay(
                        // 使用GeometryReader获取按钮的宽度
                        GeometryReader { geometry in
                            if sound.isPlaying {
                                // 使用进度条宽度来设置进度条的位置和大小
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(width: geometry.size.width, height: 4)
                                    .offset(x: 0, y: -2)
                            }
                        }
                    )
                }
//                .background(isPlaying ? Color.green : Color.clear)
//                .buttonStyle(CustomButtonStyle())
            }
            .listStyle(.plain)
            .padding(.horizontal)
        }
        .background(.white)
    }
}

#Preview {
    ContentView()
}
