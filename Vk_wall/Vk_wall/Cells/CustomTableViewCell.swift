//
//  CustomTableViewCell.swift
//  Vk_wall
//
//  Created by Азат Султанов on 12.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//
import UIKit

protocol CustomCell {
    static func cellIdentifier() -> String 
    
    static func cellNib() -> UINib
        
}

protocol CustomCellDelegate: AnyObject {
    func didPressButton(for cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell, CustomCell{
    
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var labelOne: UILabel!
    
    weak var delegate: CustomCellDelegate?
    
    func configure(with post: Wall, delegate: CustomCellDelegate ){
        labelOne.text = post.text
        labelOne.sizeToFit()
        
        avatarImage.image = UIImage(named: "Avatar")
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        self.delegate = delegate
        
    }
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    static func cellNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBAction func showButton(_ sender: Any) {
        delegate?.didPressButton(for: self)
        
    }
}

