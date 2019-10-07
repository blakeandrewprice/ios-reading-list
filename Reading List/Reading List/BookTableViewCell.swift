//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var readOrNotButton: UIButton!
    //MARK: - Actions
    @IBAction func readOrNotButtonPressed(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
