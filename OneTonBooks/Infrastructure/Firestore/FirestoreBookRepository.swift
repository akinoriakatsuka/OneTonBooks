//
//  Firestore.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/19.
//

import FirebaseFirestore

let db = Firestore.firestore()

class FirestoreBookRepository : BookRepository {
    
    let collectionPath = "books"
    
    func findById(id: String) async -> Book? {
        let docRef = db.collection(collectionPath).document(id)
        do {
            let document = try await docRef.getDocument()
            if (!document.exists || document.data() == nil) {
                return nil
            }
            let book = FirestoreBookDTO(document: document).toEntity()
            print("ドキュメントの取得成功")
            return book
        } catch {
            print("ドキュメントの取得失敗")
            return nil
        }
    }
    
    func save(book : Book) async {
        do {
            try await db.collection(collectionPath).document(book.id)
                .setData(FirestoreBookDTO.init(entity: book).toData()
            )
        } catch {
            fatalError()
        }
    }
}


