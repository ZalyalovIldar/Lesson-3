//
//  FullPostViewController.swift
//  TableViewLesson
//
//  Created by Enoxus on 05/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class FullPostViewController: UIViewController, PostEditDelegate {
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    let editingViewSegueId = "showEditingViewSegue"
    
    var post: Post!
    
    weak var postDeleteDelegate: PostDeleteDelegate?
    weak var postEditDelegate: PostEditDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
    
    func configure(with post: Post, postDeleteDelegate: PostDeleteDelegate?, postEditDelegate: PostEditDelegate?) {
        
        self.post = post
        self.postDeleteDelegate = postDeleteDelegate
        self.postEditDelegate = postEditDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let text = post.text {
            postTextLabel.text = text
        }
        else {
            postTextLabel.isHidden = true
        }
        
        if let imageName = post.imageName {
            postImageView.image = UIImage(named: imageName)
        }
        else {
            postImageView.isHidden = true
        }
    }
    
    func showEditActionSheet() {
        
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let cancelActionButton = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheetController.addAction(cancelActionButton)

        let saveActionButton = UIAlertAction(title: "Редактировать", style: .default) { action -> Void in
            self.performSegue(withIdentifier: self.editingViewSegueId, sender: self)
        }
        
        actionSheetController.addAction(saveActionButton)

        let deleteActionButton = UIAlertAction(title: "Удалить", style: .destructive) { action -> Void in
            self.showDeletionActionSheet()
        }
        
        actionSheetController.addAction(deleteActionButton)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func showDeletionActionSheet() {
        
        let actionSheetController = UIAlertController(title: "Удаление поста", message: "Вы уверены, что хотите продолжить?", preferredStyle: .actionSheet)

        let cancelActionButton = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheetController.addAction(cancelActionButton)

        let deleteActionButton = UIAlertAction(title: "Удалить", style: .destructive) { action -> Void in
            
            self.postDeleteDelegate?.deleteButtonPressed(on: self.post)
            self.navigationController?.popViewController(animated: true)
        }
        
        actionSheetController.addAction(deleteActionButton)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func actionsButtonTapped(_ sender: Any) {
        showEditActionSheet()
    }
    
    func saveButtonPressed(on post: Post, new: Post) {
        
        self.post = new
        
        if let text = new.text {
            
            postTextLabel.isHidden = false
            postTextLabel.text = text
        }
        else {
            postTextLabel.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == editingViewSegueId {
            
            let destVC = segue.destination as! PostEditingViewController
            destVC.configure(with: post, postEditMainDelegate: postEditDelegate, postEditDetailsDelegate: self)
        }
    }
}
