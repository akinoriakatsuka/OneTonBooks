//
//  ContentView.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("データを取得") {
                Task {
                    let book = await bookUseCase.getBookById(id: "0FD838FD-5374-4AAE-BF21-34AF25E0720D")
                    if let book {
                        print(book)
                    }
                }
            }
            Button("データを追加") {
                Task {
                    let book = await bookUseCase.createBook(name: "あああ")
                    print(book)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
