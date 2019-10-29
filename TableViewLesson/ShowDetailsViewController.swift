//
//  ShowDetailsViewController.swift
//  TableViewLesson
//
//  Created by Evgeniy on 06/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol DetailsViewControllerDelegate: AnyObject {
    func didChangeNewsOnDetailController(_ news: NewsModel)
}

class ShowDetailsViewController: UIViewController, DetailsViewControllerDelegate {
    
    let editingSegueIdentifier = "editingSegue"
    let cancelText = "Отмена"
    let deleteText = "Удалить"
    let editText = "Редактировать"
    let editingText = "Редактирование"
    let emptyText = ""
    let deletePostTextQuestion = "Удалить пост?"
    let indentFromTheEdgesOfTheScreen: CGFloat = 15
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsLabel: UILabel!
    
    var news: NewsModel!
    var windowFrame: CGRect!
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        windowFrame = UIScreen.main.bounds
        if let newsText = news.text {
            
            newsLabel.text = newsText
            newsLabel.sizeToFit()
        }
        else {
            newsLabel.isHidden = true
        }
        
        if let imageName = news.imageName {
            newsImageView.image = UIImage(named: imageName)
        }
        else {
            
            newsImageView.isHidden = true
            newsLabel.frame.origin.x = newsImageView.frame.origin.x
            newsLabel.frame.origin.y = newsImageView.frame.origin.y
            newsLabel.frame = CGRect(x: newsLabel.frame.origin.x, y: newsLabel.frame.origin.y, width: windowFrame.width - indentFromTheEdgesOfTheScreen,height: windowFrame.height)
            newsLabel.sizeToFit()
            newsLabel.numberOfLines = 0
        }
    }
    
    @IBAction func editingButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: editingText, message: emptyText, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: editText, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            self.performSegue(withIdentifier: self.editingSegueIdentifier, sender: self.news)
        })
        let removeAction = UIAlertAction(title: deleteText, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let removingAlert = UIAlertController(title: self.deletePostTextQuestion, message: self.emptyText, preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: self.deleteText, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                
                self.delegate?.deleteNews(self.news)
                self.navigationController?.popViewController(animated: true)
            })
            let noAction = UIAlertAction(title: self.cancelText, style: .cancel, handler: nil)
            removingAlert.addAction(yesAction)
            removingAlert.addAction(noAction)
            self.present(removingAlert, animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: nil)
        
        if news.text != nil {
            alert.addAction(editAction)
        }
        alert.addAction(removeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func didChangeNewsOnDetailController(_ news: NewsModel) {
        
        self.news = news
        newsLabel.text = news.text
        newsLabel.sizeToFit()
        delegate?.didChangeNews(news)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == editingSegueIdentifier, let newsModel = sender as? NewsModel {
            
            let destinationController = segue.destination as? EditingViewController
            destinationController?.news = newsModel
            destinationController?.delegate = self
        }
    }
}
