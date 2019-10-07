//
//  ShowDetailsViewController.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    var news : NewsModel!
    var windowFrame : CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        windowFrame = UIScreen.main.bounds
        if let newsText = news.text {
        newsLabel.text = newsText
        } else {
            newsLabel.isHidden = true
        }
        
        if let imageName = news.imageName {
        newsImageView.image = UIImage(named: imageName)
        } else {
            newsImageView.isHidden = true
            newsLabel.frame.origin.x = newsImageView.frame.origin.x
            newsLabel.frame.origin.y = newsImageView.frame.origin.y
            newsLabel.frame = CGRect(x: newsLabel.frame.origin.x, y: newsLabel.frame.origin.y, width: windowFrame.width - 10,height: windowFrame.height)
            newsLabel.sizeToFit()
            newsLabel.numberOfLines = 0
        }
    }
}
