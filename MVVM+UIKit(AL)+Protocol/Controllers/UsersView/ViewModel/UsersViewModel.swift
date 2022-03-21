//
//  UsersViewModel.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

protocol UsersViewModelDelegate: AnyObject {
    
    func didReceive(_ viewModel: UsersViewModel?, error: Error?)
    func didUpdate(_ viewModel: UsersViewModel)
}

class UsersViewModel {
    
    // MARK: - Properties
    
    weak var delegate: UsersViewModelDelegate?
    private(set) var users: Users = []
    
    // MARK: - Methods
    
    func getUsers() {
        
        let api = GetUsersAPI()
        let apiLoader = APILoader(api: api)
        
        apiLoader.load { [weak self] result in
            
            guard let self = self else {
                self?.delegate?.didReceive(self, error: AppError.unknown)
                return
            }
            
            switch result {
                
            case .success(let users):
                self.users = users
                self.delegate?.didReceive(self, error: nil)
                
            case .failure(let error):
                self.delegate?.didReceive(self, error: error)
            }
        }
    }
    
    func updateUser(_ user: UserElement) {
        
        users = users.map({ oldUser in
            
            var oldUser = oldUser
            if oldUser == user {
                oldUser.isFavourite = user.isFavourite
            }
            return oldUser
        })
        delegate?.didUpdate(self)
    }
}
