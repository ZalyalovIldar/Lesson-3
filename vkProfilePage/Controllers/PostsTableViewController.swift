import UIKit

class PostsTableViewController: UITableViewController {
    
    var posts: [Post] = []
    var postIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCells()
        Post.posts = Post.generateSomePosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        posts = Post.posts
        tableView.reloadData()
    }
    
    func setupCells() {
        
        let nibUserInfoTableViewCell = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        tableView.register(nibUserInfoTableViewCell, forCellReuseIdentifier: "userInfoCell")
        
        let nibPhotosTableViewCell = UINib(nibName: "PhotosTableViewCell", bundle: nil)
        tableView.register(nibPhotosTableViewCell, forCellReuseIdentifier: "photosCell")

        let nibAddPostTableViewCell = UINib(nibName: "AddPostTableViewCell", bundle: nil)
        tableView.register(nibAddPostTableViewCell, forCellReuseIdentifier: "addPostCell")

        let nibPostTableViewCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nibPostTableViewCell, forCellReuseIdentifier: "postCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 4:
            return posts.count
        default:
            return 1
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! UserInfoTableViewCell
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as! PhotosTableViewCell
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPostCell", for: indexPath) as! AddPostTableViewCell
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
            cell.configureCell(for: posts[indexPath.row])
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
            
        case 1:
            return 1

        case 2:
            return 10
            
        case 3:
            return 10
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 230

        case 2:
            return 115

        case 3:
            return 60
            
        case 4:
            return 500
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 4 {
            postIndex = indexPath.row
            performSegue(withIdentifier: "showPostInfoSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segueDestination = segue.destination as? DetailedPostTableViewController {
            segueDestination.post = posts[postIndex]
        }
    }
}
