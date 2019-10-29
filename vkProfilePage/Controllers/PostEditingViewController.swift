import UIKit

class PostEditingViewController: UIViewController {
    
    var post: Post!
    weak var delegate: DataPassingDelegate!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        post.text = textView.text
        delegate.changePost(for: post)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = post.text
    }
}

protocol DataPassingDelegate: AnyObject {
    
    func changePost(for post: Post)
}
