//
//  BookUseCase.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/21.
//

import Foundation

protocol BookUseCase {
    func getBookById(id : String) async -> Book?
    func createBook(name: String) async -> Book
}

class BookUseCaseImpl : BookUseCase {
    
    private let bookRepository : BookRepository
    
    init(bookRepository : BookRepository) {
        self.bookRepository = bookRepository
    }
    
    func getBookById(id : String) async -> Book? {
        return await self.bookRepository.findById(id: id)
    }
    
    func createBook(name: String) async -> Book {
        let book = Book(name: name)
        await self.bookRepository.save(book: book)
        return book
    }
    
}
