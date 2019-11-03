//
//  EditPostViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 07/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

class EditPostViewController: UIViewController {
    
    @IBOutlet weak var text: UITextView!
    
    weak var delegate: ViewControllerDelegate?
    var post: Post!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.text = post.text
    }
  
    @IBAction func doneButtonPressed(_ sender: Any) {
        post.text = text.text
        
        delegate?.didChangeInfo(post: post, isNewPost: false, forDelete: false)
        navigationController?.popViewController(animated: true)
    }
}
