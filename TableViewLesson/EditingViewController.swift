//
//  EditingViewController.swift
//  TableViewLesson
//
//  Created by Evgeniy on 07/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class EditingViewController: UIViewController {

    var news: NewsModel!
    weak var delegate: DetailsViewControllerDelegate?
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        news.text = textEditingTextView.text
        delegate?.didChangeNews(news)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet private weak var textEditingTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textEditingTextView.text = news.text
        print("!")
    }   
}
