import Foundation
import UIKit

class Post {
    
    let postDate: Date
    let image: UIImage?
    let text: String?
    
    init(postDate: Date, image: UIImage?, text: String?) {
        self.postDate = postDate
        self.image = image
        self.text = text
    }
    
    static func generateSomePosts() -> [Post] {
        
        let post1 = Post(postDate: Date(), image: UIImage(named: "examplePhoto1"), text: "TEST 1")
        let post2 = Post(postDate: Date(), image: UIImage(named: "examplePhoto2"), text: "TEST 2")
        let post3 = Post(postDate: Date(), image: UIImage(named: "user3"), text: "TEST 3")
        let post4 = Post(postDate: Date(), image: UIImage(named: "photo1"), text: "TEST 4")
        
        return [post1, post2, post3, post4]
    }
}
