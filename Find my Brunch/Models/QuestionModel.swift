//
//  QuestionModels.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//
import Foundation

// โครงสร้างคำถาม
struct Question: Identifiable, Equatable {
    let id: Int
    let text: String
    let category: String
    let imageName: String
    let nextQuestions: [Question]?
}

// หมวดหมู่อาหารหลักที่คนไทยนิยม
let categoryQuestions: [Question] = [
    Question(id: 1, text: "อยากกินอาหารเส้น?", category: "อาหารเส้น", imageName: "noodles", nextQuestions: [
        Question(id: 10, text: "ชอบแบบน้ำหรือแห้ง?", category: "น้ำ/แห้ง", imageName: "soup-vs-dry", nextQuestions: [
            Question(id: 100, text: "แบบน้ำ", category: "ก๋วยเตี๋ยวน้ำใส", imageName: "noodle-soup", nextQuestions: nil),
            Question(id: 101, text: "แบบแห้ง", category: "บะหมี่แห้ง", imageName: "dry-noodle", nextQuestions: nil),
            Question(id: 102, text: "เย็นตาโฟ", category: "เย็นตาโฟ", imageName: "yentafo", nextQuestions: nil),
            Question(id: 103, text: "ราเมง", category: "ราเมง", imageName: "ramen", nextQuestions: nil)
        ])
    ]),

    Question(id: 2, text: "อยากกินอาหารไทยรสจัดจ้าน?", category: "อาหารไทย", imageName: "thai-food", nextQuestions: [
        Question(id: 20, text: "ชอบรสชาติแบบไหน?", category: "รสชาติ", imageName: "flavor", nextQuestions: [
            Question(id: 200, text: "เผ็ดร้อน", category: "ผัดกะเพรา", imageName: "spicy-basil", nextQuestions: nil),
            Question(id: 201, text: "เปรี้ยวหวาน", category: "ผัดไทย", imageName: "pad-thai", nextQuestions: nil),
            Question(id: 202, text: "กลมกล่อม", category: "แกงเขียวหวาน", imageName: "green-curry", nextQuestions: nil),
            Question(id: 203, text: "ต้มยำ", category: "ต้มยำกุ้ง", imageName: "tom-yum", nextQuestions: nil)
        ])
    ]),

    Question(id: 3, text: "อยากกินอาหารอีสานแซ่บๆ?", category: "อาหารอีสาน", imageName: "isan-food", nextQuestions: [
        Question(id: 30, text: "เน้นส้มตำหรืออาหารย่าง?", category: "ส้มตำ/ย่าง", imageName: "somtum-vs-grilled", nextQuestions: [
            Question(id: 300, text: "ส้มตำ", category: "ส้มตำปูปลาร้า", imageName: "somtum", nextQuestions: nil),
            Question(id: 301, text: "ไก่ย่าง", category: "ไก่ย่างเขาสวนกวาง", imageName: "grilled-chicken", nextQuestions: nil),
            Question(id: 302, text: "ลาบ", category: "ลาบหมู", imageName: "larb", nextQuestions: nil),
            Question(id: 303, text: "น้ำตก", category: "น้ำตกหมู", imageName: "namtok", nextQuestions: nil)
        ])
    ]),

    Question(id: 4, text: "อยากกินอาหารนานาชาติ?", category: "อาหารนานาชาติ", imageName: "international-food", nextQuestions: [
        Question(id: 40, text: "อยากกินอาหารสไตล์ไหน?", category: "สไตล์อาหาร", imageName: "food-style", nextQuestions: [
            Question(id: 400, text: "อิตาเลียน", category: "พิซซ่า", imageName: "pizza", nextQuestions: nil),
            Question(id: 401, text: "ญี่ปุ่น", category: "ซูชิ", imageName: "sushi", nextQuestions: nil),
            Question(id: 402, text: "เกาหลี", category: "บิบิมบับ", imageName: "bibimbap", nextQuestions: nil),
            Question(id: 403, text: "เม็กซิกัน", category: "ทาโก้", imageName: "taco", nextQuestions: nil)
        ])
    ]),

    Question(id: 5, text: "อยากกินอาหารจานเดียวง่ายๆ?", category: "อาหารจานเดียว", imageName: "one-dish", nextQuestions: [
        Question(id: 50, text: "ชอบเมนูข้าวหรือเมนูผัด?", category: "ข้าว/ผัด", imageName: "rice-vs-stir-fry", nextQuestions: [
            Question(id: 500, text: "ข้าวมันไก่", category: "ข้าวมันไก่", imageName: "chicken-rice", nextQuestions: nil),
            Question(id: 501, text: "ข้าวหมูแดง", category: "ข้าวหมูแดง", imageName: "red-pork-rice", nextQuestions: nil),
            Question(id: 502, text: "ผัดซีอิ๊ว", category: "ผัดซีอิ๊ว", imageName: "pad-see-ew", nextQuestions: nil),
            Question(id: 503, text: "ข้าวผัด", category: "ข้าวผัดกุ้ง", imageName: "fried-rice", nextQuestions: nil)
        ])
    ]),

    Question(id: 6, text: "อยากกินอาหารทะเล?", category: "อาหารทะเล", imageName: "seafood", nextQuestions: [
        Question(id: 60, text: "ชอบแบบปิ้งย่าง, ต้ม, ผัด, หรือทอด?", category: "วิธีการทำ", imageName: "seafood-cook", nextQuestions: [
            Question(id: 600, text: "ปิ้งย่าง", category: "กุ้งเผา", imageName: "grilled-shrimp", nextQuestions: nil),
            Question(id: 601, text: "ต้ม", category: "ต้มยำทะเล", imageName: "tom-yum-seafood", nextQuestions: nil),
            Question(id: 602, text: "ผัด", category: "หอยลายผัดน้ำพริกเผา", imageName: "stir-fried-clams", nextQuestions: nil),
            Question(id: 603, text: "ทอด", category: "ปลาหมึกชุบแป้งทอด", imageName: "fried-calamari", nextQuestions: nil)
        ])
    ])
]
