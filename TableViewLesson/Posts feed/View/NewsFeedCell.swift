//
//  NewsFeedCell.swift
//  TableViewLesson
//
//  Created by Amir on 03/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    var post: Post!
    let elementsInsets: CGFloat =  32
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        profileImageView.image = post.profileImage
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        nameLabel.text = post.authorName
        timeLabel.text = post.time
        
        postTextLabel.text = post.postText
        postTextLabel.sizeToFit()
        
        postImage.image = post.postImage
    }
    
    func calculateCellHeight() -> CGFloat {
        
        var cellHeight = profileImageView.frame.height + bottomView.frame.height + elementsInsets
        
        if postTextLabel.text != nil {
            postTextLabel.isHidden = false
            cellHeight += postTextLabel.frame.height
            separatorView.isHidden = false
        } else {
            postTextLabel.isHidden = true
        }
        
        if postImage.image != nil {
            postImage.isHidden = false
            cellHeight += postImage.frame.height
            separatorView.isHidden = true
        } else {
            postImage.isHidden = true
        }
        
        return cellHeight
    }
    
    static func cellNibName() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

