//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var bookTextView: UITextView!
    
    var bookcontroller: BookController?
    var book: Book?
    
    //MARK: - Actions
    @IBAction func saveBookButtonPressed(_ sender: UIBarButtonItem) {
        if let book = book {
            bookcontroller?.updateTitleOrReasonToRead(title: bookTitleTextField.text ?? "",
                                                      reason: bookTextView.text ?? "",
                                                      for: book)
        } else {
            bookcontroller?.createBook(title: bookTitleTextField.text ?? "",
                                       reasonToRead: bookTextView.text ?? "",
                                       hasBeenRead: false)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    

    
    func updateViews() {
        if let book = book {
            bookTitleTextField.text = book.title
            bookTextView.text = book.reasonToRead
            navigationItem.title = book.title
        } else {
            navigationItem.title = "Add a New Book"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}
