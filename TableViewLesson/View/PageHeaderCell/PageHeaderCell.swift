//
//  PageHeaderCellTableViewCell.swift
//  TableViewLesson
//
//  Created by Enoxus on 04/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PageHeaderCell: UITableViewCell {
    
    @IBOutlet weak var aviImageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
                
        aviImageView.layer.cornerRadius = aviImageView.bounds.height / 2
    }
}
