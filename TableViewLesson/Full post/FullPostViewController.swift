//
//  FullPostViewController.swift
//  TableViewLesson
//
//  Created by Amir on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class FullPostViewController: UIViewController, PostEditDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    var post: Post!
    weak var postDeleteDelegate: PostDeleteDelegate?
    weak var postEditDelegate: PostEditDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configure(with: post)
    }
    
    func doneButtonPressed(on post: Post) {
        
        self.post = post
        
        if let text = post.postText {
            
            postTextLabel.isHidden = false
            postTextLabel.text = text            
        } else {
            postTextLabel.isHidden = true
        }
        
        postEditDelegate?.doneButtonPressed(on: post)
    }
    
    func configure(with model: Post) {
        
        profileImageView.image = model.profileImage
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        nameLabel.text = model.authorName
        timeLabel.text = model.time
        
        postTextLabel.text = model.postText
        postTextLabel.sizeToFit()
        
        if let image = model.postImage {
            
            postImageView.image = image
        } else {
            changeLayout(with: model)
        }
    }
    
    func changeLayout(with model: Post) {
        
        if model.postImage == nil {
            
            postImageView.removeFromSuperview()
            
            let bottomViewTopConstraint = bottomView.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 8)
            
            contentView.addConstraint(bottomViewTopConstraint)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.editPostSegue {
            
            let destVC = segue.destination as! EditViewController
            
            destVC.post = post
            destVC.postEditDelegate = self
        }
    }
    
    @IBAction func actionsButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "Редактировать", style: .default) { [weak self] editAction in
            
            self?.performSegue(withIdentifier: Constants.editPostSegue, sender: self)
        }
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { deleteAction in
            self.deleteAlert()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func deleteAlert() {
        
        let alertController = UIAlertController(title: "Удалить пост?", message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Удалить", style: .destructive) { delete in
            
            self.postDeleteDelegate?.deletePostButtonPressed(on: self.post)
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(delete)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
