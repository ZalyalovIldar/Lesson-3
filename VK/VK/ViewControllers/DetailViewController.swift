//
//  DetailViewController.swift
//  VK
//
//  Created by Гиниятуллина Алсу Зямилевна on 13/10/2019.
//  Copyright © 2019 Гиниятуллина Алсу Зямилевна. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    weak var delegate: ViewControllerDelegate?
    
    @IBAction func editPost(_ sender: Any) {
        actionPost()
    }
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userImage.layer.cornerRadius = userImage.frame.height / 2
        
        postText.text = post.postText
        postImage.image = post.postImage
        
        postText.sizeToFit()
    }
    
    func actionPost() {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        let editPost = UIAlertAction(title: "Редактировать", style: .default) { action -> Void in
            //изменение текста
            
        }

        let deletePost = UIAlertAction(title: "Удалить", style: .destructive) { action -> Void in
            self.deletePost()
        }

        alert.addAction(cancel)
        alert.addAction(editPost)
        alert.addAction(deletePost)
        
        self.present(alert, animated: true, completion: nil)
    }

    func deletePost() {

        let alert = UIAlertController(title: "Удалить пост?", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        let deletePost = UIAlertAction(title: "Удалить", style: .destructive) { delete in
            //удаление поста
        self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(deletePost)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
}

