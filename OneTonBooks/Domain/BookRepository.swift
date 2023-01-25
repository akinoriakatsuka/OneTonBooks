//
//  BookRepository.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/20.
//

import Foundation

public protocol BookRepository {
    func findById(id : String) async -> Book?
    func save(book : Book) async -> ()
}
