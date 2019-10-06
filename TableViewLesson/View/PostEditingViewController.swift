//
//  PostEditingViewController.swift
//  TableViewLesson
//
//  Created by Enoxus on 05/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PostEditingViewController: UIViewController {

    @IBOutlet weak var postTextView: UITextView!
    
    var post: Post!
    
    weak var postEditDelegate: PostEditDelegate?
    
    func configure(with post: Post, postEditDelegate: PostEditDelegate?) {
        
        self.post = post
        self.postEditDelegate = postEditDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        postTextView.text = post.text ?? ""
    }
    
    @IBAction func cancelEditingButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let newText: String? = postTextView.text.isEmpty ? nil : postTextView.text
        
        let newPost = Post(text: newText, imageName: post.imageName)
        
        postEditDelegate?.saveButtonPressed(on: post, new: newPost)
        dismiss(animated: true)
    }
}
