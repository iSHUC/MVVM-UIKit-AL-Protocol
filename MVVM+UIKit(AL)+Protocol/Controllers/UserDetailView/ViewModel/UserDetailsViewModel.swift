//
//  UserDetailsViewModel.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

protocol UserDetailsViewModelDelegate: AnyObject {
    
    func didUpdate(_ viewModel: UserDetailsViewModel, user: UserElement)
}

class UserDetailsViewModel {
    
    // MARK: - Properties
    
    weak var delegate: UserDetailsViewModelDelegate?
    private(set) var user: UserElement
    
    // MARK: - Init
    
    init(user: UserElement) {
        
        self.user = user
    }
    
    // MARK: - Methods
    
    func address() -> String {
        
        let suite = user.address?.suite ?? ""
        let street = user.address?.street ?? ""
        let city = user.address?.city ?? ""
        let zipcode = user.address?.zipcode ?? ""
        
        let address = suite + ", " + street + ", " + city + ", " + zipcode
        return address
    }
    
    func setFavourite(isFavourite: Bool) {
        
        user.isFavourite = isFavourite
        delegate?.didUpdate(self, user: user)
    }
}
