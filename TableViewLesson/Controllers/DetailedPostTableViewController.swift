//
//  DetailedPostTableViewController.swiftDetailedPostTableViewController
//  TableViewLesson
//
//  Created by Сергей Шабельник on 09.11.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class DetailedPostTableViewController: UITableViewController {
    
    var post: Posts!
    
    @IBAction func optionButtonDidPressed(_ sender: Any) {
        showOptions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibPostTableViewCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nibPostTableViewCell, forCellReuseIdentifier: "postCell")
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - UIAlertController
    
    func showOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title: "Редактировать", style: .default) {  (UIAlertAction) in self.performSegue(withIdentifier: "editPostSegue", sender: self)
        })

        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { (UIAlertAction) in self.showDeleteOptions()
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    func showDeleteOptions() {
 
        let alert = UIAlertController(title: "Удалить пост?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: {
            (UIAlertAction) in
            
            Posts.remove(with: self.post.postID)
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction((UIAlertAction(title: "Отмена", style: .cancel, handler: nil)))
        
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.configureCell(for: post)
        cell.customTextLabel.numberOfLines = .max
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? EditPostViewController{
            destinationViewController.delegate = self
            destinationViewController.post = post
        }
    }
}

// MARK: - Extension

extension DetailedPostTableViewController: dataPassingDelegate{
    
    func changeText(for post: Posts) {
        self.post = post
        Posts.changePost(with: post.postID, newPost: post)
        tableView.reloadData()
    }
}
