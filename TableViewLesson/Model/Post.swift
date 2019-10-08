//
//  Group.swift
//  TableViewLesson
//
//  Created by Amir on 03/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

struct Post {
    
    var profileImage: UIImage = #imageLiteral(resourceName: "profileImage")
    var authorName: String! = "Амир Марданов"
    var time: String!
    var postText: String?
    var postImage: UIImage?
    var postId: Int = 0
    
    init(time: String, postText: String?, postImage: UIImage?) {
        self.time = time
        self.postText = postText
        self.postImage = postImage
        postId += 1
    }    
}

