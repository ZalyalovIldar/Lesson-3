//
//  Post.swift
//  Homework
//
//  Created by Роман Шуркин on 06/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var id: String
    var user: User
    var date: String
    var text: String
    var image: UIImage?
    
    init(user: User, date: String, text: String, image: UIImage?) {
        
        self.id = UUID().uuidString
        self.user = user
        self.date = date
        self.text = text
        self.image = image
        
    }
}
