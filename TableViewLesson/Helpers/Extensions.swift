//
//  Extensions.swift
//  TableViewLesson
//
//  Created by Enoxus on 04/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        self.register(UINib(nibName: cell.nibName, bundle: nil), forCellReuseIdentifier: cell.nibName)
    }
}

extension UITableViewCell {
    
    static var nibName: String {
        
        get {
            return String(describing: self)
        }
    }
}
