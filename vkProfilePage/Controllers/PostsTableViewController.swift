import UIKit

class PostsTableViewController: UITableViewController {
    
    let numberOfSections = 4
    let heightForFooterInSection0 = CGFloat(1)
    let heightForFooterInSection1 = CGFloat(8)
    let heightForFooterInSection2 = CGFloat(8)
    let heightForRowAtSection1 = CGFloat(115)
    let heightForRowAtSection2 = CGFloat(60)
    let showPostInfoSegue = "showPostInfoSegue"
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCells()
        Post.posts = Post.generateSomePosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        return numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 3:
            return posts.count
        default:
            return 1
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! UserInfoTableViewCell
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as! PhotosTableViewCell
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPostCell", for: indexPath) as! AddPostTableViewCell
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
            cell.configureCell(for: posts[indexPath.row])
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
            
        case 0:
            return heightForFooterInSection0

        case 1:
            return heightForFooterInSection1
            
        case 2:
            return heightForFooterInSection2
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 1 { return heightForRowAtSection1 }
        if indexPath.section == 2 { return heightForRowAtSection2 }

        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {
            performSegue(withIdentifier: showPostInfoSegue, sender: posts[indexPath.row])
        }
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segueDestination = segue.destination as? DetailedPostTableViewController {
            segueDestination.post = sender as? Post
        }
    }
}
