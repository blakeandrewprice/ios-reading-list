//
//  BookController.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController: Codable {
    //MARK: - Variables/Constants
    var books: [Book] = []
    
    //MARK: - Computed Properties
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            else { return nil }
        
        return documents.appendingPathComponent("books.plist")
    }
    
    var readBooks: [Book] {
        return books.filter { $0.hasBeenRead == true }
    }
    
    var unreadBooks: [Book] {
        return books.filter { $0.hasBeenRead == false }
    }
    
    //MARK: - Persistent
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
    
    //MARK: - Functions
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
    
    
    
    
    
    
    // LOOK AT PINNED TWEET BY CRAIG ON UPDATING VIA CELL
    func updateHasBeenRead(for book: Book) {
        
        let index = books.index(of: book)
        if let unwrappedIndex = index {
            var bookToUpdate = books[unwrappedIndex]
            bookToUpdate.hasBeenRead.toggle()
            books[unwrappedIndex] = bookToUpdate
        }
        saveToPersistentStore()
    }
    
    func updateTitleOrReasonToRead(title: String, reason: String, for book: Book) {
        let index = books.index(of: book)
        if let unwrappedIndex = index {
            var bookToUpdate = books[unwrappedIndex]
            bookToUpdate.title = title
            bookToUpdate.reasonToRead = reason
            books[unwrappedIndex] = bookToUpdate
        }
        saveToPersistentStore()
    }
}
