//
//  AddRepostTableViewCellTableViewCell.swift
//  Homework
//
//  Created by Роман Шуркин on 04/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

protocol AddRepostCellDelegate: AnyObject {
    func didPressAction(for cell: UITableViewCell)
}

class AddRepostTableViewCell: UITableViewCell, CustomCell,  UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
    @IBOutlet weak var avatar: UIImageView!
    
    weak var delegate: AddRepostCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: User, delegate: AddRepostCellDelegate) {
        
        avatar.image = user.avatar
        self.delegate = delegate
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIden() -> String {
        return String(describing: self)
    }
    
    @IBAction func newRepostButtonPressed(_ sender: Any) {
        delegate?.didPressAction(for: self)
    }
    
    @IBAction func changePhotoFromGallery(_ sender: Any) {
        delegate?.didPressAction(for: self)
    }
    
    @IBAction func takeNewPhoto(_ sender: Any) {
        delegate?.didPressAction(for: self)
    }
}
