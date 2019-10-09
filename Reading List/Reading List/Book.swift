//
//  Book.swift
//  Reading List
//
//  Created by Blake Andrew Price on 10/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    //MARK: - Properties
    var title:          String,
        reasonToRead:   String,
        hasBeenRead:    Bool
    
    //MARK: - Init
    init(title: String, reasonToRead: String, hasBeenRead: Bool) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = false
    }
}
