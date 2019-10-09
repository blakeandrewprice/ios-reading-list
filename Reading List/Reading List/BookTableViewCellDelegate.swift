//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: AnyObject {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
