//
//  BookController.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController: Codable {
    var books: [Book] = []
    
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            else { return nil }
        
        return documents.appendingPathComponent("books.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(books)
            try data.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = readingListURL else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: data)
            books = decodedBooks
        } catch  {
            print("Error loading books data: \(error)")
        }
    }
    
    @discardableResult
    func createBook(title: String, reasonToRead: String, hasBeenRead: Bool) -> Book {
        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        
        books.append(book)
        
        saveToPersistentStore()
        
        return book
    }
    
    func deleteBook(book: Book) {
        if let index = books.index(of: book) {
            books.remove(at: index)
        }
        saveToPersistentStore()
    }
    
    
}
