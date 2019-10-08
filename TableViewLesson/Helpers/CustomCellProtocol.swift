//
//  CustomCellProtocol.swift
//  TableViewLesson
//
//  Created by Amir on 08.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol CustomCell {
    
    static func cellNibName() -> UINib?
    static func cellIdentifier() -> String
}
