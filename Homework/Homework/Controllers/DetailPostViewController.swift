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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textOfPost.text = post.text
        image.image = post.image
        
        textOfPost.sizeToFit()
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editText = UIAlertAction(title: "Редактировать", style: .default) { (action) in
            self.performSegue(withIdentifier: "editText", sender: self.post)
        }
        
        let deletePost = UIAlertAction(title: "Удалить", style: .destructive) { (action) in
        
            let alertDelete = UIAlertController(title: "Удалить пост?", message: nil, preferredStyle: .actionSheet)
            let delete = UIAlertAction(title: "Удалить", style: .destructive) { (action) in
                
                self.delegate?.didChangeInfo(self.post, false, true)
                self.navigationController?.popViewController(animated: true)
            }
            let cancelDelete = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
                
            }
            
            alertDelete.addAction(delete)
            alertDelete.addAction(cancelDelete)
            
            self.present(alertDelete, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(editText)
        alert.addAction(deletePost)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func didChangeInfo(_ post: Post, _ isNewPost: Bool, _ forDelete: Bool) {
        textOfPost.text = post.text
        delegate?.didChangeInfo(post, false, false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editText", let post = sender as? Post {
            
            let destController = segue.destination as! EditPostViewController
            
            destController.post = post
            destController.delegate = self
        }
    }
}
