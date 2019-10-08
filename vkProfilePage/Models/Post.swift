import Foundation
import UIKit

class Post {
    
    let postID = UUID().uuidString
    let postDate: Date
    var image: UIImage?
    var text: String?
    
    static var posts: [Post] = []
    
    static func generateSomePosts() -> [Post] {
        
        let post1 = Post(postDate: Date(), image: nil, text: nil)
        let post2 = Post(postDate: Date(), image: UIImage(named: "examplePhoto2"), text: "TEST 2")
        let post3 = Post(postDate: Date(), image: UIImage(named: "user3"), text: "TEST 3")
        let post4 = Post(postDate: Date(), image: UIImage(named: "photo1"), text: "TEST 4")
        
        return [post1, post2, post3, post4]
    }
    
    static func changePost(with UUID: String, for newPost: Post) {
        for var post in posts {
            if post.postID == UUID {
                post = newPost
            }
        }
    }
    
    static func removePost(with UUID: String) {
        for (index, post) in posts.enumerated() {
            if post.postID == UUID {
                posts.remove(at: index)
                return
            }
        }
    }
    
    init(postDate: Date, image: UIImage?, text: String?) {
        self.postDate = postDate
        self.image = image
        self.text = text
    }
}
