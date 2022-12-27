//
//  ViewModel.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 13/12/22.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func successRequest()
    func errorRequest()
}

class ViewModel {
    private var listUser: [User] = []
    
    private let service = Service()
    
    private weak var delegate: ViewModelDelegate?
    
    public func delegate(delegate: ViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchAllRequest() {
        service.getUserFromJson(fromFileNamed: "user") { success, error in
            if let successResult = success {
                self.listUser = successResult.group
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        }
    }
    
    public func fetchAllRequestMocky() {
        service.getUser() { success, error in
            if let successResult = success {
                self.listUser = successResult.group
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        }
    }
    
    public var numberOfRowsUsers: Int {
        return listUser.count
    }
    
    public func loadCurrentUser(indexPath: IndexPath) -> User {
        return listUser[indexPath.row]
    }
    
    public func getUsername(indexPath: IndexPath) -> String {
        return listUser[indexPath.row].name ?? ""
    }
    
    public func updateHeartButtonState(_ user: User) {
        if let row = listUser.firstIndex(where: {user.identifier == $0.identifier}) {
            listUser[row] = user
        }
    }
}
