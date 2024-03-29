//
//  Extension.swift
//  food_picker
//
//  Created by Actor on 2024/1/29.
//

import SwiftUI

extension View {
    func mainButtonStyle(shape: ButtonBorderShape = .capsule) -> some View {
//       .buttonStyle(.borderedProminent) .就是 self.
        buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(shape)
    }

    func roundedRectBackground(radius: CGFloat = 8, by shape: some ShapeStyle = .bg) -> some View {
        background(RoundedRectangle(cornerRadius: radius)
            .foregroundStyle(shape))
    }
}

extension Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}

extension ShapeStyle where Self == Color {
    static var bg: Color {
        Color(.systemBackground)
    }

    static var bg2: Color {
        Color(.secondarySystemBackground)
    }

    static var groupBg: Color { Color(.secondarySystemBackground) }
}

extension AnyTransition {
    static let delayInsertionOpacity = Self.asymmetric(
        insertion: .opacity
            .animation(.easeIn(duration: 0.5).delay(0.2)),
        removal: .opacity
            .animation(.easeOut(duration: 0.4)))

    static let moveUpWithOpacity = Self.move(edge: .top).combined(with: .opacity)
}
