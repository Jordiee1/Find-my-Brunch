//
//  MenuItem.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import Foundation

struct MenuItem: Identifiable, Codable, Equatable {
    let id: Int
    let text: String
    let category: String
    let imageName: String
}
