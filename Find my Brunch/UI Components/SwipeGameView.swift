//
//  SwipeGameView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

//
//  SwipeGameView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//
import SwiftUI

struct SwipeGameView: View {
    @State private var currentQuestion: Question? = categoryQuestions.first
    @State private var matchedCategory: String?
    @State private var questionHistory: [Question] = []
    @State private var isActiveResultView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if let question = currentQuestion {
                    SwipeCardView(question: question, questionNumber: getQuestionNumber(for: question)) { didSwipeRight in
                        handleSwipe(didSwipeRight: didSwipeRight)
                    }
                } else {
                    NavigationLink(destination: ResultView(matchedCategory: matchedCategory ?? "ไม่มีคำแนะนำ", imageName: imageNameForCategory(matchedCategory), isActive: $isActiveResultView), isActive: $isActiveResultView) {
                        VStack {
                            Text("ผลลัพธ์ของคุณคือ")
                                .font(.title)
                                .fontWeight(.bold)

                            Text(matchedCategory ?? "ไม่มีคำแนะนำ")
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                                .padding()

                            Text("ดูผลลัพธ์")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .padding(.horizontal, 40)
                        }
                    }
                    .isDetailLink(false)

                }
            }
            .animation(.easeInOut, value: currentQuestion)
            .onChange(of: matchedCategory) { _ in
                if matchedCategory != nil {
                    isActiveResultView = true
                } else {
                    isActiveResultView = false
                }
            }
        }
    }

    // ฟังก์ชันเพื่อให้ค่า questionNumber (เหมือนเดิม)
    private func getQuestionNumber(for question: Question) -> Int {
        var number = 1
        func findQuestion(_ questions: [Question], level: Int) -> Int? {
            for q in questions {
                if q.id == question.id {
                    return level
                }
                if let next = q.nextQuestions, let found = findQuestion(next, level: level + 1) {
                    return found
                }
            }
            return nil
        }
        return findQuestion(categoryQuestions, level: number) ?? 1
    }

    // ฟังก์ชันจัดการการปัดซ้าย-ขวา (เหมือนเดิม)
    private func handleSwipe(didSwipeRight: Bool) {
        guard let current = currentQuestion else { return }

        questionHistory.append(current)

        if didSwipeRight {
            if let nextQuestions = current.nextQuestions {
                currentQuestion = nextQuestions.first
            } else {
                matchedCategory = current.category
                currentQuestion = nil
            }
        } else {
            if let nextQuestion = findNextOption() {
                currentQuestion = nextQuestion
            } else {
                matchedCategory = "ไม่มีคำแนะนำเพิ่มเติม"
                currentQuestion = nil
            }
        }
    }


    // รีเซ็ตเกม (แก้ไข)
    private func restartGame() {
        currentQuestion = categoryQuestions.first // เริ่มต้นคำถามแรก
        matchedCategory = nil // ล้างผลลัพธ์
        questionHistory = [] // ล้างประวัติ
        isActiveResultView = false // ปิด ResultView
    }


    // ค้นหาคำถามถัดไปในตัวเลือกอื่น (เหมือนเดิม)
    private func findNextOption() -> Question? {
        var queue = categoryQuestions
        var visited = Set<Int>()

        while !queue.isEmpty {
            let question = queue.removeFirst()

            if visited.contains(question.id) {
                continue
            }
            visited.insert(question.id)

            if let nextQuestions = question.nextQuestions {
                queue.append(contentsOf: nextQuestions)
            }

            if question.id != currentQuestion?.id && !questionHistory.contains(where: { $0.id == question.id }) {
                return question
            }
        }
        return nil
    }

    // ฟังก์ชันสำหรับหารูปภาพตาม Category (เหมือนเดิม)
    func imageNameForCategory(_ category: String?) -> String {
        switch category {
        case "อาหารอีสาน":
            return "thai-food"
        case "อาหารอิตาลี":
            return "italian-food"
        default:
            return "default-food"
        }
    }
}

// Preview (เหมือนเดิม)
#Preview {
    SwipeGameView()
}
