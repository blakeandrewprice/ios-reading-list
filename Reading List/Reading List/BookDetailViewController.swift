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
    //MARK: - Actions
    @IBAction func saveBookButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    var bookcontroller = BookController()
    var book: Book?
    
    func updateViews() {
        if book != nil {
            bookTitleTextField.text = book?.title
            bookTextView.text = book?.reasonToRead
            navigationItem.title = book?.title
        } else {
            navigationItem.title = "Add a New Book"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
