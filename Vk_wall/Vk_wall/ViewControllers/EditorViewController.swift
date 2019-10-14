//
//  EditorViewController.swift
//  Vk_wall
//
//  Created by Азат Султанов on 14.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    var post: Wall?
    weak  var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = post?.text
       
    }

    @IBAction func saveButton(_ sender: Any) {
        post?.text = textField.text
        delegate?.didChangeText(post!)
        dismiss(animated: true, completion: nil)
    }
}
