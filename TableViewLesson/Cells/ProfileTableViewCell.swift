//
//  ProfileTableViewCell.swift
//  TableViewLesson
//
//  Created by Сергей Шабельник on 19.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        editButton.layer.cornerRadius = editButton.frame.height / 2
        selectionStyle = .none
    }
}
