//
//  NewPostTableViewCell.swift
//  TableViewLesson
//
//  Created by Сергей Шабельник on 23.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class NewPostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
    }
}
