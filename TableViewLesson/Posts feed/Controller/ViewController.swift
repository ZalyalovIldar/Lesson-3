//
//  ViewController.swift
//  TableViewLesson
//
//  Created by Ильдар Залялов on 02/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [
                Post(time: "15 минут назад", postText: "Image with text for 2 lines bla-bla-bla-bla-bla-bla-bla-bla-bla-bla ", postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "25 минут назад", postText: nil, postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "35 минут назад", postText: "Еще Какой-то текст поста", postImage: nil),
                 Post(time: "45 минут назад", postText: "Какой-то текст поста", postImage: nil),
                 Post(time: "55 минут назад", postText: "Картинка с изображением", postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "1 час назад", postText: nil, postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "2 часа назад", postText: "Hello, World", postImage: nil),
                 Post(time: "Вчера в 19:46", postText: nil, postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "4 окт в 21:19", postText: "Текст", postImage: nil),
                 Post(time: "1 сен в 00:00", postText: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", postImage: #imageLiteral(resourceName: "bg")),
                 Post(time: "1 сен 2018 г.", postText: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", postImage: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(NewsFeedCell.self)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = posts[indexPath.row]
        
        performSegue(withIdentifier: Constants.fullPostSegueId, sender: model)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.cellIdentifier(), for: indexPath) as! NewsFeedCell
        let post = posts[indexPath.row]
        
        cell.post = post
        cell.configure()
        
        tableView.rowHeight = cell.calculateCellHeight()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.fullPostSegueId, let model = sender as? Post {
            
            let destinationVC = segue.destination as! FullPostViewController
            
            destinationVC.post = model
            destinationVC.postDeleteDelegate = self
            destinationVC.postEditDelegate = self
        }
    }
}

extension ViewController: PostEditDelegate, PostDeleteDelegate {
    
    func deletePostButtonPressed(on post: Post) {
        
        if let postIndex = posts.firstIndex(where: { $0.postId == post.postId }) {
            
            posts.remove(at: postIndex)
            tableView.reloadData()
        }
    }
    
    func doneButtonPressed(on post: Post) {
       
        if let postIndex = posts.enumerated().first(where: { $0.element.postId == post.postId }) {
    
            posts.remove(at: postIndex.offset)
            posts.insert(post, at: postIndex.offset)
            
            tableView.reloadData()
        }
    }
}
