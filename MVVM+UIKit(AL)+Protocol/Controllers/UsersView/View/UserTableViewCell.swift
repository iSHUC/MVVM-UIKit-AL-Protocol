//
//  UserTableViewCell.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    // MARK: - Properties
    
    static var identifier: String { "UserTableViewCell" }
    
    // MARK: - Configure
    
    func configure(user: UserElement) {
        
        nameLabel.text = user.name
        companyNameLabel.text = user.company?.name
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        let isFavourite = user.isFavourite ?? false
        isFavourite ? (favouriteButton.isSelected = true) : (favouriteButton.isSelected = false)
    }
}
