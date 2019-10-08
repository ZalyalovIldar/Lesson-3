//
//  Delegates.swift
//  TableViewLesson
//
//  Created by Amir on 08.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol PostDeleteDelegate: AnyObject {
    
    func deletePostButtonPressed(on post: Post)
}

protocol PostEditDelegate: AnyObject {
    
    func doneButtonPressed(on post: Post)
}
