//
//  HistoryItem.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import Foundation

struct HistoryItem: Identifiable {
    let id = UUID()
    let menuName: String
    let date: Date
}
