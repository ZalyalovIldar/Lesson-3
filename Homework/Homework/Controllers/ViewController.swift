//
//  ViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 03/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didChangeInfo(post: Post, isNewPost: Bool, forDelete: Bool)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddRepostCellDelegate, RepostCellDelegate, ViewControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var heightOfPostCell: CGFloat = 399
    var heightOfAddPostCell: CGFloat = 44
    var row = 2
    var user = User(name: "Roma Shurkin", avatar: #imageLiteral(resourceName: "ava"))
    var posts = [Post]()
    
    let identifierOfDetailPost = "detailPost"
    let identifierOfAddPost = "addPost"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCustomCell(AddRepostTableViewCell.self)
        tableView.registerCustomCell(RepostTableViewCell.self)
        
        posts.append(Post(user: user, date: "", text: "Может быть много нововстей, доабвляйте новые посты!!!", image: #imageLiteral(resourceName: "ava")))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AddRepostTableViewCell.cellIden(), for: indexPath) as! AddRepostTableViewCell
            
            heightOfAddPostCell = cell.frame.height
            cell.configure(with: user, delegate: self)
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: RepostTableViewCell.cellIden(), for: indexPath) as! RepostTableViewCell
                   
            heightOfPostCell = cell.frame.height
            
            let index = posts.count - indexPath.row
            let newPost = posts[index]
            
            cell.configure(with: newPost, delegate: self)

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row != 0 else {
            return
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        let post = posts[posts.count - indexPath.row]
        performSegue(withIdentifier: identifierOfDetailPost, sender: post)
    }
    
    
    func didPressAction(for cell: UITableViewCell) {
        performSegue(withIdentifier: identifierOfAddPost, sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == identifierOfAddPost, let user = sender as? User {
            
            let destController = segue.destination as! AddPostViewController
            
            destController.post = Post(user: user, date: "", text: "", image: nil)
            destController.delegate = self
        }
        else if segue.identifier == identifierOfDetailPost, let post = sender as? Post {
            
            let destController = segue.destination as! DetailPostViewController
            
            destController.post = post
            destController.delegate = self
        }
    }
    
    func didChangeInfo(post: Post, isNewPost: Bool, forDelete: Bool) {
        
        if isNewPost {
            posts.append(post)
        }
        else if forDelete {
            
            posts = posts.filter { $0.id != post.id}
        }
        
        tableView.reloadData()
    }
}

