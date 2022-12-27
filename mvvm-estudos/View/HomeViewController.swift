//
//  HomeViewController.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 12/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    let viewModel = ViewModel()
    
    var screen: HomeScreenView?
    
    override func loadView() {
        screen = HomeScreenView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchAllRequest()
    }
}

// MARK: - UITableViewDelegate, UITableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsUsers
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier) as? CustomTableViewCell
    
        cell?.setupCell(user: viewModel.loadCurrentUser(indexPath: indexPath))
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.getUsername(indexPath: indexPath))
    }
}

// MARK: - CustomTableViewCellDelegate

extension HomeViewController: CustomTableViewCellDelegate {
    func heartButtonPressed(_ user: User) {
        viewModel.updateHeartButtonState(user)
    }
}

// MARK: - ViewModelDelegate

extension HomeViewController: ViewModelDelegate {
    func successRequest() {
        screen?.setupTableViewProtocols(delgate: self, dataSource: self)
    }
    
    func errorRequest() {
        print("Error ao realizar a request")
    }
}
