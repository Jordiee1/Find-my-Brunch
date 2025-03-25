//
//  LoadingView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 26/3/2568 BE.
//

import SwiftUI

struct LoadingView: View {
    @State private var isActive = false // สถานะว่าโหลดเสร็จหรือยัง
    @State private var offsetX: CGFloat = 0 // Offset ของการ์ด
    @State private var rotation: Double = 0 // Rotation ของการ์ด
    @State private var orangeIntensity: Double = 0.5 // ความเข้มของสีส้ม
    @State private var loadingOpacity: Double = 1.0 // ความโปร่งใสของการ์ด Loading

    var body: some View {
        VStack {
            if isActive {
                SwipeGameView()
                    .transition(.opacity) // ใช้ transition เมื่อ active
            } else {
                ZStack {
                    ForEach(0..<4, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.orange.opacity(orangeIntensity)) // ใช้ orangeIntensity
                            .frame(width: 380, height: 560)
                            .offset(x: offsetX)
                            .rotationEffect(.degrees(rotation))
                            .opacity(loadingOpacity) // ใช้ loadingOpacity ในการ fade out
                            .animation(
                                Animation.easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true)
                                    .delay(Double(index) * 0.4),
                                value: offsetX // Trigger animation on offsetX change
                            )
                    }
                }
                .onAppear {
                    offsetX = 50
                    rotation = 5

                    // 1. เริ่ม animation การ์ด
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        // 2. หลังจาก animation การ์ดเสร็จ เริ่มทรานซิชันแสงวูบ
                        withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                            orangeIntensity = 0.5 // เริ่มแสงวูบ
                        }

                        // 3. หลังจากแสงวูบ ให้ fade out การ์ด Loading
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // ปรับเวลา
                            withAnimation(Animation.easeInOut(duration: 1)) {
                                loadingOpacity = 0.0 // fade out
                            }

                            // 4. หลังจาก fade out เสร็จ ให้เปลี่ยนไป SwipeGameView
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { // ปรับเวลา
                                isActive = true // active SwipeGameView
                            }
                        }
                    }
                }
            }
        }
    }
}

// Preview
#Preview {
    LoadingView()
}
