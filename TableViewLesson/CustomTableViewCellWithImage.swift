//
//  CustomTableViewCellWithImage.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class CustomTableViewCellWithImage: UITableViewCell, CustomCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func configure(with model: NewsModel) {
        
        newsImageView.image = UIImage(named: model.imageName!)
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
