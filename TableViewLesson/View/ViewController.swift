//
//  ViewController.swift
//  TableViewLesson
//
//  Created by Ильдар Залялов on 02/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PostEditDelegate, PostDeleteDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var posts = PostProvider.getPosts()
    
    let staticCellsCount = 1
    let cellSpacingHeight: CGFloat = 10
    let fullPostSegueId = "showFullPostSegue"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(cell: TextAndImageCell.self)
        mainTableView.register(cell: PageHeaderCell.self)
        
        mainTableView.separatorColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return staticCellsCount + posts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section > 0 {
            performSegue(withIdentifier: fullPostSegueId, sender: posts[indexPath.section-1])
        }
        mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: PageHeaderCell.nibName, for: indexPath)
            return cell
        }
        else {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: TextAndImageCell.nibName, for: indexPath) as! TextAndImageCell
            
            cell.configure(with: posts[indexPath.section - 1])
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fullPostSegueId, let post = sender as? Post {
            let destVC = segue.destination as! FullPostViewController
            destVC.configure(with: post, postDeleteDelegate: self, postEditDelegate: self)
        }
    }
    
    func saveButtonPressed(on post: Post, new: Post)  {
        if let postIndex = posts.firstIndex(where: { $0.id == post.id }) {
            
            posts.remove(at: postIndex)
            posts.insert(new, at: postIndex)
            mainTableView.reloadData()
        }
    }
    
    func deleteButtonPressed(on post: Post) {
        if let postIndex = posts.firstIndex(where: { $0.id == post.id }) {
            
            posts.remove(at: postIndex)
            mainTableView.reloadData()
        }
    }
}

