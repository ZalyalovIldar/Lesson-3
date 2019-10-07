//
//  RepostTableViewCell.swift
//  Homework
//
//  Created by Роман Шуркин on 04/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

protocol CustomCell {
    
    static func cellNib() -> UINib?

    static func cellIden() -> String
}

protocol RepostCellDelegate: AnyObject {
    func didPressAction(for cell: UITableViewCell)
}


class RepostTableViewCell: UITableViewCell, CustomCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var dateOfRepost: UILabel!
    @IBOutlet weak var textOfRepost: UITextView!
    @IBOutlet weak var imageOfRepost: UIImageView!
    @IBOutlet weak var heightOfTextConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOfImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOfViewWithTextAndImage: NSLayoutConstraint!
    @IBOutlet weak var heightOfStackConstraint: NSLayoutConstraint!
    
    weak var delegate: RepostCellDelegate?
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with post: Post, delegate: RepostCellDelegate) {
        
        avatar.image = post.user.avatar
        nameOfUserLabel.text = post.user.name
        dateOfRepost.text = post.date
        textOfRepost.text = post.text
        imageOfRepost.image = post.image
    
        textOfRepost.sizeToFit()
        
        if  post.image == nil && post.text == ""  {
            heightOfStackConstraint.constant = 50
            heightOfTextConstraint.constant = 0
        }
        else if post.image == nil {
            heightOfStackConstraint.constant = 150
            heightOfTextConstraint.constant = 106
        }
        else if post.text == "" {
            heightOfTextConstraint.constant = 0
            heightOfStackConstraint.constant = 280
        }
        else {
            heightOfTextConstraint.constant = 106
            heightOfStackConstraint.constant = 357
        }
        
        self.delegate = delegate
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIden() -> String {
        return String(describing: self)
    }
}
