import Foundation
import UIKit

class Post {
    
    let postID = UUID().uuidString
    let postDate: Date
    var image: UIImage?
    var text: String?
    
    static var posts: [Post] = []
    
    static func generateSomePosts() -> [Post] {

        let hugeText =
"""
1
2
3
4
5
6
7
8
9
10
"""
        let post1 = Post(postDate: Date(), image: nil, text: "Текст без изображения")
        let post2 = Post(postDate: Date(), image: UIImage(named: "imageWithoutText"), text: nil)
        let post3 = Post(postDate: Date(), image: nil, text: hugeText)
        var posts = [post1, post2, post3]
        
        for i in 1...10 {
            let newPost = Post(postDate: Date(), image: UIImage(named: "examplePhoto\(i)"), text: nil)
            posts.append(newPost)
        }
        
        return posts
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
