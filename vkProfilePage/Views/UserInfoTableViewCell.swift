import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        editProfileButton.layer.cornerRadius = editProfileButton.frame.height / 2
        self.selectionStyle = .none
    }
}
