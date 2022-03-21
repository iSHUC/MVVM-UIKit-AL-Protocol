//
//  UserDetailsViewController.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    // MARK: - UI Properties
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var catchPhraseLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var favouriteButton: UIButton!
    
    // MARK: - Properties
    
    private(set) var viewModel: UserDetailsViewModel!
    
    // MARK: - Load

    static func load(_ viewModel: UserDetailsViewModel) -> UserDetailsViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userDetailsViewController = storyboard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        userDetailsViewController.viewModel = viewModel
        return userDetailsViewController
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    // MARK: - Configure
    
    private func configureView() {
        
        configureUser()
    }
    
    private func configureUser() {
        
        nameLabel.text = viewModel.user.name
        usernameLabel.text = viewModel.user.username
        addressLabel.text = viewModel.address()
        companyNameLabel.text = viewModel.user.company?.name
        catchPhraseLabel.text = viewModel.user.company?.catchPhrase
        phoneLabel.text = viewModel.user.phone
        websiteLabel.text = viewModel.user.website
        let isFavourite = viewModel.user.isFavourite ?? false
        isFavourite ? (favouriteButton.isSelected = true) : (favouriteButton.isSelected = false)
    }
    
    // MARK: - Methods

    @IBAction private func didTapFavourite(_ sender: UIButton) {
        
        viewModel.setFavourite(isFavourite: !sender.isSelected)
        configureUser()
    }
}
