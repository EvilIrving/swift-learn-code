//
//  Data.swift
//  meow
//
//  Created by Actor on 2024/2/28.
//

import Foundation
import SwiftUI

struct Sound: Identifiable {
    var id = UUID()
    var name: String = ""
    var emotion: String = ""
    var image: String = ""
    var audioFile: URL?
    var isPlaying = false

    static let sounds = [Sound(name: "毛毛高兴", emotion: "happy", image: "😄", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛调皮", emotion: "happy", image: "😜", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛伤心", emotion: "happy", image: "😭", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛难过", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛悲伤", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛悲伤", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛悲伤", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛悲伤", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛悲伤", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
                         Sound(name: "毛毛尖叫", emotion: "happy", image: "😞", audioFile: URL(string: "../resources/compassion-exercise-8mins.mp3")),
    ]
}
