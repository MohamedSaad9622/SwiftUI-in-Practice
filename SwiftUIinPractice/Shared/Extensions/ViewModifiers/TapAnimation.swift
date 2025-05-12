//
//  TapAnimation.swift
//  SwiftUIinPractice
//
//  Created by Mohamed Saad on 12/05/2025.
//

import SwiftUI

struct TapAnimation: ViewModifier {
    @State private var isPressed = false
    let action: () -> Void
    let scale: CGFloat
    let animation: Animation

    init(
        scale: CGFloat = 0.95,
        animation: Animation = .spring(response: 0.25, dampingFraction: 0.5),
        action: @escaping () -> Void
    ) {
        self.scale = scale
        self.animation = animation
        self.action = action
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? scale : 1.0)
            .animation(animation, value: isPressed)
            .onTapGesture {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                    action()
                }
            }
    }
}

extension View {
    func animatedTap(
        scale: CGFloat = 0.95,
        animation: Animation = .spring(response: 0.25, dampingFraction: 0.5),
        action: @escaping () -> Void
    ) -> some View {
        self.modifier(TapAnimation(scale: scale, animation: animation, action: action))
    }
}

