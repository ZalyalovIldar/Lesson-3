//
//  ViewController.swift
//  TableViewLesson
//
//  Created by Ильдар Залялов on 02/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
//        self.tblUsers.register(nib, forCellReuseIdentifier: "MyCustomCell")
        
        let userCell = UINib.init(nibName: "UserCell", bundle: nil)
        tableView.register(userCell, forCellReuseIdentifier: "userCell")
        // Do any additional setup after loading the view.
    }


}

