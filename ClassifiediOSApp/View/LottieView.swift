//
//  LottieView.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation

import Lottie
import SwiftUI

// This is Lottie View which helps in using the animation to UIViewRepresentable so that the animation can used in the application.
struct LottieView: UIViewRepresentable{
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}
