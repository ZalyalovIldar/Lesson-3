//
//  DetailPostViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 07/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

class DetailPostViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var textOfPost: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    weak var delegate: ViewControllerDelegate?
    var post: Post!
    
    let textOfTittleEdit = "Редактировать"
    let textOfTittleDelete = "Удалить"
    let textOfTittleDeleteWarning = "Удалить пост?"
    let textOfTittleCancel = "Отмена"
    
    let identifierOfEdit = "editText"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textOfPost.text = post.text
        image.image = post.image
        
        textOfPost.sizeToFit()
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editText = UIAlertAction(title: textOfTittleEdit, style: .default) { (action) in
            self.performSegue(withIdentifier: self.identifierOfEdit, sender: self.post)
        }
        
        let deletePost = UIAlertAction(title: textOfTittleDelete, style: .destructive) { (action) in
        
            let alertDelete = UIAlertController(title: self.textOfTittleDeleteWarning, message: nil, preferredStyle: .actionSheet)
            let delete = UIAlertAction(title: self.textOfTittleDelete, style: .destructive) { (action) in
                
                self.delegate?.didChangeInfo(post: self.post, isNewPost: false, forDelete: true)
                self.navigationController?.popViewController(animated: true)
            }
            let cancelDelete = UIAlertAction(title: self.textOfTittleCancel, style: .cancel) { (action) in
                
            }
            
            alertDelete.addAction(delete)
            alertDelete.addAction(cancelDelete)
            
            self.present(alertDelete, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: textOfTittleCancel, style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(editText)
        alert.addAction(deletePost)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func didChangeInfo(post: Post, isNewPost: Bool, forDelete: Bool) {
        textOfPost.text = post.text
        delegate?.didChangeInfo(post: post, isNewPost: false, forDelete: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == identifierOfEdit, let post = sender as? Post {
            
            let destController = segue.destination as! EditPostViewController
            
            destController.post = post
            destController.delegate = self
        }
    }
}
