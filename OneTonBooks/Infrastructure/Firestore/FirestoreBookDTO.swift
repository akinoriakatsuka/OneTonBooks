//
//  FirestoreBookDTO.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/21.
//

import Foundation
import FirebaseFirestore

class FirestoreBookDTO {
    let collectionPath = "books"
    
    var id : String
    var name : String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    init(document: DocumentSnapshot) {
        self.id = document.documentID
        self.name = document.data()!["name"] as? String ?? ""
    }
    
    init(entity: Book) {
        self.id = entity.id
        self.name = entity.name
    }
    
    func toEntity() -> Book {
        return Book(id: self.id, name: self.name)
    }
    
    func toData() -> [String : Any] {
        return [
            "id": self.id,
            "name": self.name,
        ]
    }
    
}
