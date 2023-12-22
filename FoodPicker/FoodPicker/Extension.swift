//
//  Extension.swift
//  FoodPicker
//
//  Created by Actor on 2023/10/20.
//


import SwiftUI

extension  Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.57)
    static let myEase = Animation.easeInOut(duration: 0.6)
}

extension Color {
    static let bg = Color(.systemBackground)
    static let bg2 = Color(.secondarySystemBackground)
}

extension View {
    func mainButtonStyle() -> some View{
        buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
    }
    
    func RoundedRectBackGround(radius:CGFloat = 8, fill: some ShapeStyle = Color.bg)-> some View {
        background( RoundedRectangle(cornerRadius: radius)
            .foregroundColor(fill as? Color))
    }
}
extension AnyTransition {
    static let moveTopWithOpacity = AnyTransition.move(edge: .top).combined(with: .opacity)
    
    static let delayInsertionOpacity = AnyTransition.asymmetric(
        insertion:
                .opacity.animation(.easeIn(duration: 0.5).delay(0.2)),
        removal:
                .opacity.animation(.easeOut(duration: 0.4)))
}
