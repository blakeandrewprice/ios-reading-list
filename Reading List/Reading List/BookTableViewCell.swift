//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    //MARK: - Properties
    var book: Book?
    weak var delegate: BookTableViewCellDelegate?
    
    //MARK: - Outlets
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var readOrNotButton: UIButton!

    //MARK: - Actions
    @IBAction func readOrNotButtonPressed(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let book = book else { return }
        
        bookTitleLabel.text = book.title
        
        if book.hasBeenRead == false {
            if let image = UIImage(named: "unchecked") {
                readOrNotButton.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(named: "checked") {
                readOrNotButton.setImage(image, for: .normal)
            }
        }
    }
}
