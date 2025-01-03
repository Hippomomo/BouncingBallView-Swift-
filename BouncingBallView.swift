//
//  BouncingBallView.swift
//  
//
//  
//

import SwiftUI

struct BouncingBallView: View {
    @State private var offsetY: CGFloat = -300
    @State private var isBouncing = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Circle()
                .fill(Color.orange)
                .frame(width: 50, height: 50)
                .offset(y: offsetY)
                .onAppear {
                    bounce()
                }
        }
    }

    private func bounce() {
        withAnimation(Animation.interpolatingSpring(stiffness: 200, damping: 5).repeatForever(autoreverses: false)) {
            offsetY = 300
        }
    }
}

struct BouncingBallView_Previews: PreviewProvider {
    static var previews: some View {
        BouncingBallView()
    }
}
