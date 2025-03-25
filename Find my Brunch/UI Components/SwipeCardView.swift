//
//  SwipeCardView..swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//
import SwiftUI

struct SwipeCardView: View {
    let question: Question
    let questionNumber: Int
    var onSwipe: (Bool) -> Void

    @State private var offset: CGSize = .zero
    @State private var showXmark = false
    @State private var showReload = false
    @State private var showHeart = false
    @State private var showSwipeLabel = false
    @State private var showOverlay = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    // Header
                    HStack {
                        Image("fmb_logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                        Text("Find my")
                            .font(Font.custom("IBMPlexSansThai-Light", size: 14))
                        + Text(" Brunch")
                            .font(Font.custom("IBMPlexSansThai-Bold", size: 14))
                            .foregroundColor(Color.orange)
                        Spacer()

                        Button(action: {
                            // ใส่ฟังก์ชันย้อนกลับ
                        }) {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.orange)
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    // Card
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.yellow.opacity(0.08))
                            .frame(width: 340, height: 520)
                            .shadow(radius: 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.orange, lineWidth: 15)
                            )
                            .background(
                                Image("fmb_bg")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 340, height: 600)
                                    .clipped()
                                    .opacity(0.05)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 40))

                        VStack {
                            Text("คำถามที่ \(questionNumber)")
                                .font(Font.custom("IBMPlexSansThai-Bold", size: 22))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .padding(.top, 80)
                            Spacer()

                            Text(question.text)
                                .font(Font.custom("IBMPlexSansThai-Bold", size: 30))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                                .padding(.top, -90)

                            Spacer()
                        }
                    }
                    .offset(x: offset.width, y: 0)
                    .rotationEffect(.degrees(Double(offset.width / 20)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if offset.width > 100 {
                                    onSwipe(true)
                                } else if offset.width < -100 {
                                    onSwipe(false)
                                }
                                offset = .zero
                            }
                    )

                    Spacer()

                    // Buttons
                    HStack(spacing: 30) {
                        Button(action: { onSwipe(false) }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.yellow.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .opacity(showXmark ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: showXmark)

                        Button(action: {
                            // รีโหลดการ์ด
                        }) {
                            Image(systemName: "arrow.counterclockwise")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.orange)
                                .padding()
                                .background(Color.yellow.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .opacity(showReload ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: showReload)

                        Button(action: { onSwipe(true) }) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .clipShape(Circle())
                        }
                        .opacity(showHeart ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: showHeart)
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.edgesIgnoringSafeArea(.all))

                // Overlay
               if showOverlay {
                    Color.black.opacity(0.8) // พื้นหลังเข้มขึ้น
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Text("วิธีการเล่น")
                            .font(Font.custom("IBMPlexSansThai-bold", size: 30))
                            .foregroundColor(.white)
                            .offset(y: -geometry.size.height / 30) // เลื่อนขึ้นไปด้านบน
                            .animation(.easeInOut(duration: 0.5), value: showSwipeLabel) // Animation
                        
                        Text("Find my")
                            .font(Font.custom("IBMPlexSansThai-Medium", size: 30))
                            .foregroundColor(.white)
                        + Text(" Brunch")
                            .font(Font.custom("IBMPlexSansThai-Bold", size: 30))
                            .foregroundColor(Color.orange)
                        
                    

                        Text("ปัดซ้าย = ไม่ใช่ \nปัดขวา = ใช่")
                            .font(Font.custom("IBMPlexSansThai-Medium", size: 24))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()

                        Button(action: {
                            withAnimation {
                                showOverlay = false // ปิด Overlay เมื่อกดปุ่ม
                            }
                        }) {
                            Text("เริ่มปัดเลย!")
                                .font(Font.custom("IBMPlexSansThai-bold", size: 20))
                             
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .clipShape(Capsule())
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        showXmark = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        showReload = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        showHeart = true
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        showOverlay = true
                        showSwipeLabel = true
                    }
                }
            }
        }
    }
}


#Preview {
    SwipeCardView(question: categoryQuestions[0], questionNumber: 1) { _ in }
}
