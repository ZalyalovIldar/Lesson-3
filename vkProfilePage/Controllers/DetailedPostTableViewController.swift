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
    
    func presentOptionsAlertController() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "Edit", style: .default) { (UIAlertAction) in
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
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func setupTableView() {
        let nibCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "postCell")
    }
}
