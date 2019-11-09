//
//  TableViewController.swift
//  TableViewLesson
//
//  Created by Сергей Шабельник on 19.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var posts: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userCell = UINib.init(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(userCell, forCellReuseIdentifier: "profileCell")
        
        let photoCell = UINib.init(nibName: "PhotoLibraryTableViewCell", bundle: nil)
        tableView.register(photoCell, forCellReuseIdentifier: "photoCell")
        
        let newPostCell = UINib.init(nibName: "NewPostTableViewCell", bundle: nil)
        tableView.register(newPostCell, forCellReuseIdentifier: "newPostCell")
        
        let postCell = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(postCell, forCellReuseIdentifier: "postCell")
        
        Posts.generatePosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        posts = Posts.postsArray
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
            case 3:
                return posts.count
            default:
                return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 200
            case 1:
                return 103
            case 2:
                return 63
            default:
                return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           switch section {
               
           case 0:
               return 1

           case 1:
               return 8
               
           case 2:
               return 8
               
           default:
               return 0
           }
       }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoLibraryTableViewCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "newPostCell", for: indexPath) as! NewPostTableViewCell
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
                cell.configureCell(for: posts[indexPath.row])
                return cell
            
            default:
                return UITableViewCell()
        }
    }

    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? DetailedPostTableViewController{
            destinationViewController.post = sender as? Posts
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3{
        performSegue(withIdentifier: "detailedPostSegue", sender: posts[indexPath.row])
        }
    }
}
