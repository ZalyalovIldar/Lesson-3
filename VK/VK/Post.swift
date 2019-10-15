//
//  Post.swift
//  VK
//
//  Created by Гиниятуллина Алсу Зямилевна on 13/10/2019.
//  Copyright © 2019 Гиниятуллина Алсу Зямилевна. All rights reserved.
//

import UIKit

struct Post{
    
    var postText: String
    var postImage: UIImage
    var postId: Int

    init(postText: String, postImage: UIImage, postId: Int) {
        self.postText = postText
        self.postImage = postImage
        self.postId = postId
    }
}
