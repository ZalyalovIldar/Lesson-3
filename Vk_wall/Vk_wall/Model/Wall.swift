//
//  Wall.swift
//  Vk_wall
//
//  Created by Азат Султанов on 12.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import Foundation
class Wall{
    let name: String
    let time: String
    let age: Int
    var text: String
    var id: Int
    init(text: String, id: Int) {
        self.text = text
        self.name = "Pavel Prokopev"
        self.time = "Был в сети ровно 5 минут назад"
        self.age = 19
        self.id = id
    }
}
