import UIKit

class DetailedPostTableViewController: UITableViewController {
    
    var post: Post!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    @IBAction func optionsButtonPressed(_ sender: Any) {
        presentOptionsAlertController()
    }
    
    //MARK: - Alert Controllers
    
    func presentOptionsAlertController() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "Edit", style: .default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "editPostSegue", sender: self)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            self.presentDeletionConfirmationAlertController()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentDeletionConfirmationAlertController() {
        
        let alertController = UIAlertController(title: nil, message: "Delete Post?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            
            Post.removePost(with: self.post.postID)
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestination = segue.destination as! PostEditingViewController
        segueDestination.post = post
        segueDestination.delegate = self
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
        cell.postText.numberOfLines = .max
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func setupTableView() {
        let nibCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "postCell")
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

//MARK: - Delegate

extension DetailedPostTableViewController: dataPassingDelegate {
    
    func changePost(for post: Post) {
        
        self.post = post
        Post.changePost(with: post.postID, for: post)
        tableView.reloadData()
    }
}
