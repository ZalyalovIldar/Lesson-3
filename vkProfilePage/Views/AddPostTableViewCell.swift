import UIKit

class AddPostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
    }
}
