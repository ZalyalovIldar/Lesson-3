//
//   NewsModel.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct NewsModel {
    
    var text : String?
    var imageName : String?
    
    init(newsText : String?, newsImageName : String?) {
        
        self.text = newsText
        self.imageName = newsImageName
    }
}
