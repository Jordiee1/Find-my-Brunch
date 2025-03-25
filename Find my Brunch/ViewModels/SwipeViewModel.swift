//
//  SwipeViewModel.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import SwiftUI

class SwipeViewModel: ObservableObject {
    @Published var menuItems = DataManager.loadMenu()
}
