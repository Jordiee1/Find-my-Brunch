//
//  DataManager.swift
//  Find my Brunch
//
//  Created by จิดาภา สีเพชร on 24/3/2568 BE.
//

import Foundation

class DataManager {
    static func loadMenu() -> [MenuItem] {
        if let url = Bundle.main.url(forResource: "MenuData", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                return (try? decoder.decode([MenuItem].self, from: data)) ?? []
            }
        }
        return []
    }
}
