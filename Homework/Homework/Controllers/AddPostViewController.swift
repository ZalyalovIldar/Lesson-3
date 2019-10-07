//
//  AddPostViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 06/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    var post: Post!
    var imagePicker = UIImagePickerController()
    
    weak var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func addPost() {
        delegate?.didChangeInfo( post, true, false)
    }
    
    @IBAction func addPostButtonPressed(_ sender: Any) {
        
        post.date = ""
        post.text = textView.text
        post.image = image.image ?? nil
        
        addPost()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoFromGallery(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takeNewPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.image.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
