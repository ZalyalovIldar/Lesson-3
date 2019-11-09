//
//  File.swift
//  TableViewLesson
//
//  Created by Сергей Шабельник on 23.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class Posts{
    
    let postID: Int!
    var postImage: UIImage?
    var postText: String?
    
    static var postsArray: [Posts] = []
    
    static func generatePosts(){
        let post1 = Posts(image: UIImage(named: "bmw1"), text: "Текст и фото", index: 1)
        let post2 = Posts(image: nil, text: "Пост без фото", index: 2)
        let post3 = Posts(image: nil, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", index: 3)
        let post4 = Posts(image: UIImage(named: "bmw2"), text: "", index: 4)
        let post5 = Posts(image: UIImage(named: "bmw3"), text: "", index: 5)
        let post6 = Posts(image: UIImage(named: "bmw4"), text: "", index: 6)
        let post7 = Posts(image: UIImage(named: "bmw5"), text: "", index: 7)
        let post8 = Posts(image: UIImage(named: "bmw6"), text: "", index: 8)
        
        postsArray = [post1, post2, post3, post4, post5, post6, post7, post8]

    }
    
    static func remove(with index: Int){
        
        for post in postsArray{
            if post.postID == index{
                postsArray.remove(at: index - 1)
                break
            }
        }
    }
    
    static func changePost(with index: Int, newPost: Posts){
        
        for var post in postsArray{
            if post.postID == index{
                post = newPost
                break
            }
        }
    }
    
    init(image: UIImage?, text: String?, index: Int){
        self.postImage = image
        self.postText = text
        self.postID = index
    }
    
    
}
