//
//  Extensions.swift
//  Vk_wall
//
//  Created by Азат Султанов on 13.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
    
}
