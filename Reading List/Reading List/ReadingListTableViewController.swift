//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController, BookTableViewCellDelegate {
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        bookController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - Properties
    let bookController = BookController()

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Read Books"
        } else {
            return "Unread Books"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bookController.readBooks.count
        } else {
            return bookController.unreadBooks.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { fatalError("A book cell was not found!") }
        cell.delegate = self
        let book = bookFor(indexPath: indexPath)
        cell.book = book
        cell.updateViews()
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let book = bookFor(indexPath: indexPath)
            if let index = bookController.books.index(of: book) {
                bookController.books.remove(at: index)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewBookSegue" {
            if let bookDetailVC = segue.destination as? BookDetailViewController {
                bookDetailVC.bookcontroller = bookController
            }
        } else if segue.identifier == "ShowCellSegue" {
            if let bookDetailVC = segue.destination as? BookDetailViewController,
                let selectedCell = sender as? BookTableViewCell {
                bookDetailVC.bookcontroller = bookController
                bookDetailVC.book = selectedCell.book
            }
        }
    }
    
    private func bookFor(indexPath: IndexPath) -> Book {
        if indexPath.section == 0 {
            return bookController.readBooks[indexPath.row]
        } else {
            return bookController.unreadBooks[indexPath.row]
        }
    }
    
    func toggleHasBeenRead(for cell: BookTableViewCell) {
        if let unwrappedBook = cell.book {
            bookController.updateHasBeenRead(for: unwrappedBook)
        }
        tableView.reloadData()
     }


    


}
