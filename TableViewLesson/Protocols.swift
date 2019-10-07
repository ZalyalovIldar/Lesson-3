//
//  Protocols.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

protocol CustomCell {
    
    static func cellNib() -> UINib?
    static func cellIdentifier() -> String
}
