//
//  Extensions.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCustomCell(_ cell: CustomCell.Type) {
        
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}
