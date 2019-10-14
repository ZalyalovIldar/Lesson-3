//
//  ViewController2.swift
//  Vk_wall
//
//  Created by Азат Султанов on 13.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    var post: Wall?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = post?.text
        avatarImage.image = UIImage(named: "Avatar")
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        nameLabel.text = post?.name
    }
}
