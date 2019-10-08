//
//  TableViewExtension.swift
//  TableViewLesson
//
//  Created by Amir on 04/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(_ cell: NewsFeedCell.Type) {
        self.register(cell.cellNibName(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}

extension UILabel {
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}
