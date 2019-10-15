//
//  ViewController.swift
//  VK
//
//  Created by Гиниятуллина Алсу Зямилевна on 13/10/2019.
//  Copyright © 2019 Гиниятуллина Алсу Зямилевна. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func editText(_ post: Post)
    func removePost(_ post: Post)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var post: [Post] = []
    let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        post.append(Post(postText: "кусь", postImage: #imageLiteral(resourceName: "s1200.jpeg"), postId: 1))
        post.append(Post(postText: "кутить - кусить", postImage: #imageLiteral(resourceName: "post-5.png"), postId: 2))
        post.append(Post(postText: "котики милые", postImage: #imageLiteral(resourceName: "cat_face_eyes_charming_39894_1920x1200.jpg"), postId: 3))
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "id")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = post[indexPath.row]
        performSegue(withIdentifier: "detailViewController", sender: model)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailViewController", let postModel = sender as? Post {
            
            let destController = segue.destination as! DetailViewController
            destController.post = postModel
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id") as! PostTableViewCell

        let model = post[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 500.0
    }
    
    func editText(_ post: Post) {
       
    }
    
    func removePost(_ post: Post) {
        
    }
}
