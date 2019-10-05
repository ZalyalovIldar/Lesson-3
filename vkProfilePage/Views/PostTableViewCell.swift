import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if likeButton.tintColor == .red {
            likeButton.tintColor = .lightGray
        } else {
            likeButton.tintColor = .red
        }
    }
    
    func configureCell(for post: Post) {
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
        
        postText.text = post.text
        postImage.image = post.image
        
        print("Cell configured with text: \(post.text!)")
    }
}
