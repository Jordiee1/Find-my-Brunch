//
//  HistoryViewModel.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var history: [HistoryItem] = []
}
