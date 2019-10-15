//
//  PostTableViewCell.swift
//  VK
//
//  Created by Гиниятуллина Алсу Зямилевна on 13/10/2019.
//  Copyright © 2019 Гиниятуллина Алсу Зямилевна. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    func configure(with post: Post) {
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        postText.text = post.postText
        postImage.image = post.postImage
    }    
}
