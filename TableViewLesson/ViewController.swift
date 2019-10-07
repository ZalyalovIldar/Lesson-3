//
//  ViewController.swift
//  TableViewLesson
//
//  Created by Ильдар Залялов on 02/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didChangeNews(_ news: NewsModel)
    func deleteNews(_ news: NewsModel)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerDelegate {
    
    let detailSegueIdentifier = "showDetailsSegue"
    
    var newsArray: [NewsModel] = []
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsArray.append(NewsModel(newsText: "Автор не несет ответственности за достоверность, полноту и качество представленной информации. Претензии к автору в связи с материальным или нематериальным ущербом, причиненным вследствие использования или неиспользования представленной информации, а также использования неверной или неполной информации, не принимаются, за исключением случаев, когда доказана халатность или преступный умысел автора. Представленные предложения не накладывают каких-либо обязательств. Автор оставляет за собой право без предварительного уведомления изменять, удалять или дополнять содержимое.", newsImageName: nil))
        newsArray.append(NewsModel(newsText: "Я уже говорил тебе, что такое безумие? Безумие - это точное повторение одного и того же действия, раз за разом, в надежде на изменение. Это есть безумие. Когда впервые я это услышал, не помню, кто мне это сказал, я - бум - убил его. Смысл в том - окей? - Он был прав. И тогда я стал видеть это везде, везде, куда ни глянь, эти болваны... Куда ни глянь, делают точно одно и то же. Снова и снова и снова и снова и снова, и думают - сейчас все изменится. Не не не не, прошу, сейчас все будет иначе. Прости, мне не нравится, как ты на меня смотришь! Окей? У тебя проблемы с головой? Думаешь, лапшу тебе на уши вешаю?!", newsImageName: "vaas"))
        newsArray.append(NewsModel(newsText: "Not bad :)", newsImageName: "elonmusk"))
        newsArray.append(NewsModel(newsText: "A test or examination (informally, exam or evaluation) is an assessment intended to measure a test-taker's knowledge, skill, aptitude, physical fitness, or classification in many other topics.", newsImageName: nil))
        newsArray.append(NewsModel(newsText: "Hello is a song by British singer-songwriter Adele, released on 23 October 2015 by XL Recordings as the lead single from her third studio album, 25 (2015). Adele co-wrote the song with her producer, Greg Kurstin. Hello is a piano ballad with soul influences, and lyrics that discuss themes of nostalgia and regret. Upon release, the song was acclaimed by music critics, who compared it favourably to Adele's previous work and praised the song's lyrics and Adele's vocals. It was recorded in London's Metropolis Studios.", newsImageName: "image1"))
        newsArray.append(NewsModel(newsText: nil, newsImageName: "up"))
        newsArray.append(NewsModel(newsText: nil, newsImageName: "curlybraces"))
        newsArray.append(NewsModel(newsText: "Hahaha, classic...", newsImageName: "meme1"))
        newsArray.append(NewsModel(newsText: "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения. Создан компанией Apple в первую очередь для разработчиков iOS и macOS. Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на Objective-C.", newsImageName: "swift"))
        newsArray.append(NewsModel(newsText: nil, newsImageName: "image2"))
        
        newsTableView.registerCustomCell(CustomTableViewCellWithTextAndImage.self)
        newsTableView.registerCustomCell(CustomTableViewCellWithText.self)
        newsTableView.registerCustomCell(CustomTableViewCellWithImage.self)
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if newsArray[indexPath.row].text != nil {
            if newsArray[indexPath.row].imageName != nil {
                
                let cell = newsTableView.dequeueReusableCell(withIdentifier: CustomTableViewCellWithTextAndImage.cellIdentifier(), for: indexPath) as! CustomTableViewCellWithTextAndImage
                cell.configure(with: newsArray[indexPath.row])
                self.newsTableView.rowHeight = 400
                return cell
            }
            else {
                
                let cell = newsTableView.dequeueReusableCell(withIdentifier: CustomTableViewCellWithText.cellIdentifier(), for: indexPath) as! CustomTableViewCellWithText
                cell.configure(with: newsArray[indexPath.row])
                self.newsTableView.rowHeight = 200
                return cell
            }
        } else {
            
            let cell = newsTableView.dequeueReusableCell(withIdentifier: CustomTableViewCellWithImage.cellIdentifier(), for: indexPath) as! CustomTableViewCellWithImage
            cell.configure(with: newsArray[indexPath.row])
            self.newsTableView.rowHeight = 400
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == detailSegueIdentifier, let newsModel = sender as? NewsModel {
            
            let destinationController = segue.destination as? ShowDetailsViewController
            destinationController?.news = newsModel
            destinationController?.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = newsArray[indexPath.row]
        performSegue(withIdentifier: detailSegueIdentifier, sender: model)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func didChangeNews(_ news: NewsModel) {
        
        if let newsValue = newsArray.enumerated().first(where: { $0.element.id == news.id } ) {
            
            newsArray.remove(at: newsValue.offset)
            newsArray.insert(news, at: newsValue.offset)
            newsTableView.reloadData()
        }
    }
    
    func deleteNews(_ news: NewsModel) {
        
        if let newsValue = newsArray.enumerated().first(where: { $0.element.id == news.id } ) {
            
            newsArray.remove(at: newsValue.offset)
            newsTableView.reloadData()
        }
    }
}

   
