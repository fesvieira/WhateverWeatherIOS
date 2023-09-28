//
//  LottieView.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode
    var delay: Double = 0.0

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()

        let animation = LottieAnimation.named(name)
        animationView.animation = animation

        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            animationView.play()
        }

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
