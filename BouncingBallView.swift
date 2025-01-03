//
//  BouncingBallView.swift
//

import SwiftUI

struct BouncingBallView: View {
    @State private var offsetY: CGFloat = -300
    @State private var isBouncing = false
    @State private var size: CGFloat = 50
    @State private var gradientStart = UnitPoint.topLeading
    @State private var gradientEnd = UnitPoint.bottomTrailing

    var body: some View {
        ZStack {
            
//            Color.black.ignoresSafeArea()
            
            Circle()
                .fill(LinearGradient(colors: [Color.green, Color.blue, Color.purple],startPoint: gradientStart,endPoint: gradientEnd))
                .frame(width: size, height: size)
                .offset(y: offsetY)
                .onAppear {
                    bounce()
                    zoom()
                }
        }
    }

    private func bounce() {
        withAnimation(Animation.interpolatingSpring(stiffness: 200, damping: 5).repeatForever(autoreverses: false)) {
            offsetY = 300
        }
    }
    
    private func zoom() {
        withAnimation(Animation.interpolatingSpring(stiffness: 200, damping: 5).repeatForever(autoreverses: false)) {
            size = 500
        }
    }
    
}

struct BouncingBallView_Previews: PreviewProvider {
    static var previews: some View {
        BouncingBallView()
    }
}
