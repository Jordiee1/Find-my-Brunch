//
//  MainView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import SwiftUI
struct HomeView: View {
    @State private var isNavigating = false

    var body: some View {
        NavigationStack { // ✅ เพิ่ม NavigationStack ครอบ View ทั้งหมด
            VStack(spacing: 20) {
                // โลโก้และชื่อแอป
                HStack {
                    Image("fmb_logo")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Text("Find my")
                        .font(Font.custom("IBMPlexSansThai-Medium", size: 14))
                    + Text(" Brunch")
                        .font(Font.custom("IBMPlexSansThai-Bold", size: 14))
                        .foregroundColor(Color.orange)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading) // จัดชิดซ้าย
                .offset(y: -30)

                // ภาพอาหารที่จัดเรียงเป็นวงกลม
                Image("fmb_banner")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    .padding(.top, -100)
                    .padding(.bottom, 10)

                // ข้อความหัวเรื่อง
                Text("FIND YOUR **BRUNCH**\nBY YOUR MATCHED")
                    .font(.system(size: 32))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)

                // คำอธิบาย
                Text("ช่วยให้ผู้ใช้เลือกเมนูอาหารมื้อกลางวันได้ง่ายขึ้น\nโดย Swipe เพื่อเลือกหรือเมนูอาหารที่ match กับคุณ")
                    .font(.custom("IBMPlexSansThai-Medium", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)

                // ปุ่มเริ่มต้นปัด
                Button(action: {
                    isNavigating = true // เมื่อกดปุ่มจะไปหน้า SwipeGameView
                }) {
                    HStack {
                        Text("ปัดเลย")
                            .font(Font.custom("IBMPlexSansThai-Bold", size: 20))
                            .fontWeight(.bold)
                        Image(systemName: "arrow.right")
                    }
                    .frame(width: 250, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                }
            }
            
            .padding()
            // ✅ `navigationDestination` ต้องอยู่ใน `NavigationStack`
            .navigationDestination(isPresented: $isNavigating) {
                LoadingView()
            }
        }
    }
}

// Preview
#Preview {
    HomeView()
}
