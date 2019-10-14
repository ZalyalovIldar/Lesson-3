//
//  ViewController.swift
//  Vk_wall
//
//  Created by Азат Султанов on 12.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit
protocol ViewControllerDelegate: AnyObject {
    func didChangeText(_ post: Wall)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, ViewControllerDelegate {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    let fullPostIdentifier = "fullPostIdentifier"
    let editIdentifier = "editIdentifier"
    var post: [Wall] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        post.append(Wall(text: "Посты могут быть разной высоты, с разным содержимым(картинки, текст), размер ячеек подсчитать в ручную (от контента).", id: 1))
        post.append(Wall(text: "На стене с постами, текст отображается только на 5-6 строк.", id: 2))
        post.append(Wall(text: "По нажатию на пост переходим на экран детального отображения поста, где показывается полный текст.", id: 3))
        post.append(Wall(text: "На детальном отображении в правом верхнем углу на навегейшен баре есть кнопка троеточие, по нажатию на который должен всплывать UIAlertController типа actionSheet с 3 кнопками: редактировать, удалить, отмена. При нажатии на редактирование, открывается экран с текстом поста, который можно отредактировать и сохранить, после чего текст изменяется как на детальном, так и на главном экране с новостью. При нажатии на удаление появляется еще один UIAlertController с actionSheet, с вопросом Удалить пост? и кнопками Удалить, Отмена. При удалении происходит переход на главный экран с новостями, и из списка пропадает новость.", id: 4))
        post.append(Wall(text: "Для отображения разного контента можно использовать разные кастомные ячейки (для фото, для фото с текстом, для текста), у этого подхода есть свои плюсы минусы, но решать вам.", id: 5))
        
        tableView.delegate = self
        tableView.dataSource = self
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        nameLabel.text = post[0].name
        lateLabel.text = post[0].time
        ageLabel.text = String(post[0].age) + " лет"
        ageLabel.setNeedsDisplay()
        tableView.registerCustomCell(CustomTableViewCell.self)
    }
    
    /*
     Настройка tableView
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier(), for: indexPath) as! CustomTableViewCell
        
        let model = post[indexPath.row]
        
        cell.configure(with: model, delegate: self)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = post[indexPath.row]
        performSegue(withIdentifier: fullPostIdentifier, sender: model)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fullPostIdentifier, let post = sender as? Wall {
            let destController = segue.destination as! ViewController2
            destController.post = post
            
        }
        else if segue.identifier == editIdentifier, let post = sender as? Wall {
            let destController = segue.destination as! EditorViewController
            destController.post = post
            destController.delegate = self
            
        }
        
    }
    
    /*
     Действия троеточия
     */
    func didPressButton(for cell: CustomTableViewCell) {
        let didController = UIAlertController(title: "Что вы хотите сделать?", message:  nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "Редактировать", style: .default) { (UIAlertAction) in
            guard let indexPath = self.tableView.indexPath(for: cell) else{
                return
            }
            let model = self.post[indexPath.row]
            self.performSegue(withIdentifier: self.editIdentifier, sender: model)
            
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (UIAlertAction) in
            guard let indexPath = self.tableView.indexPath(for: cell) else{
                return
            }
            self.post.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        didController.addAction(editAction)
        didController.addAction(deleteAction)
        didController.addAction(cancelAction)
        
        self.present(didController, animated:true, completion: nil)
        
    }
    
    func didChangeText(_ post: Wall) {
        if let postValue = self.post.enumerated().first(where: {$0.element.id == post.id}) {
            self.post.remove(at: postValue.offset)
            self.post.insert(post, at: postValue.offset)
            tableView.reloadData()
        }
    }
}

