//
//  PostTableViewCell.swift
//  TableViewLesson
//
//  Created by Сергей Шабельник on 23.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var customTextLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    func configureCell(for posts: Posts){
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        selectionStyle = .none
        customTextLabel.text = posts.postText
        customImageView.image = posts.postImage
    }
}
