//
//  Book.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/18.
//

import Foundation

public struct Book: Codable, Identifiable {
    public var id = UUID().uuidString
    let name: String
}
