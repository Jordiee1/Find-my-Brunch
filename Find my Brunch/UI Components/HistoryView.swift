//
//  HistoryView.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var historyVM = HistoryViewModel()

    var body: some View {
        List(historyVM.history) { item in
            Text("\(item.menuName) - \(item.date)")
        }
        .navigationTitle("History")
    }
}

#Preview {
    HistoryView()
}
