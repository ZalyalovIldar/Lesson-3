//
//  EditViewController.swift
//  TableViewLesson
//
//  Created by Amir on 04/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var postTextView: UITextView!
    
    var post: Post!
    var text: String?
    
    weak var postEditDelegate: PostEditDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        postTextView.text = post.postText
    }
    
    @IBAction func cancelEditingButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let editedText: String? = postTextView.text.isEmpty ? nil : postTextView.text
        
        post.postText = editedText
        
        postEditDelegate?.doneButtonPressed(on: post)
        dismiss(animated: true)
    }
}
