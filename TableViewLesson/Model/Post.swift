//
//  Post.swift
//  TableViewLesson
//
//  Created by Enoxus on 04/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Post {
    static var postCount = 0
    
    let id: Int
    let text: String?
    let imageName: String?
    
    init(text: String?, imageName: String?) {
        
        self.text = text
        self.imageName = imageName
        id = Post.postCount
        Post.postCount += 1
    }
}
