//
//  TableViewExtension.swift
//  Homework
//
//  Created by Роман Шуркин on 04/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCustomCell(_ cell: CustomCell.Type) {
        
        register(cell.cellNib(), forCellReuseIdentifier: cell.cellIden())
    }
}
