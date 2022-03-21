//
//  UsersViewController.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: - UI Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var viewModel: UsersViewModel = {
        
        let viewModel = UsersViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    // MARK: - Configure
    
    private func configureView() {
        
        viewModel.getUsers()
    }
    
    // MARK: - Methods
    
    private func presentUser(_ user: UserElement) {
        
        let userDetailsViewModdel = UserDetailsViewModel(user: user)
        let userDetailViewController = UserDetailsViewController.load(userDetailsViewModdel)
        userDetailViewController.viewModel.delegate = self
        self.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}

// MARK: - UsersViewModelDelegate

extension UsersViewController: UsersViewModelDelegate {
    
    func didReceive(_ viewModel: UsersViewModel?, error: Error?) {
        
        DispatchQueue.main.async {
            
            if let _ = error {
                self.tableView.backgroundView = UIView()
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    func didUpdate(_ viewModel: UsersViewModel) {
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
}

// MARK: - UserDetailsViewModelDelegate

extension UsersViewController: UserDetailsViewModelDelegate {
    
    func didUpdate(_ viewModel: UserDetailsViewModel, user: UserElement) {
        
        self.viewModel.updateUser(user)
    }
}

// MARK: - UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell {
            
            cell.configure(user: viewModel.users[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presentUser(viewModel.users[indexPath.row])
    }
}
