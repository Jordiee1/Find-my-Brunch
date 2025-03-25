//
//  ResultView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import SwiftUI

struct ResultView: View {
    let matchedCategory: String
    let imageName: String // รับชื่อรูปภาพที่เลือกมาแสดง
    @Binding var isActive: Bool
//    @Environment(\.presentationMode) var presentationMode // เพิ่มบรรทัดนี้


    var body: some View {
        VStack {
            Text("มื้อนี้ของคุณคือ...")
                .font(Font.custom("IBMPlexSansThai-Bold", size: 28))
                .padding()

            Image(imageName) // แสดงรูป
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()

            Text(matchedCategory)
                .font(Font.custom("IBMPlexSansThai-Bold", size: 38))
                .padding()
                .foregroundColor(.orange)

            Button(action: {
                isActive = false // Set binding to false to go back
            }) {
                Image(systemName: "arrow.counterclockwise")
                Text("เล่นใหม่อีกครั้ง")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .font(Font.custom("IBMPlexSansThai-Bold", size: 20))
            .padding()
        }
    }
}

// Preview
#Preview {
    ResultView(matchedCategory: "อาหารอีสาน", imageName: "thai-food", isActive: .constant(true))
}
