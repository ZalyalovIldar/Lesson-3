import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likeButtonPressed(_ sender: Any) {
        if likeButton.tintColor == .red {
            likeButton.tintColor = .lightGray
        } else {
            likeButton.tintColor = .red
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
    }
}
