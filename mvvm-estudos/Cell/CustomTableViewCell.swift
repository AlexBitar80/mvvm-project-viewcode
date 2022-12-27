//
//  CustomTableViewCell.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 12/12/22.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func heartButtonPressed(_ user: User)
}

class CustomTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CustomTableViewCell"
    
    var viewModel: CustomTableViewCellViewModel?
    
    var screen = CustomTableViewCellScreen()
    
    private weak var delegate: CustomTableViewCellDelegate?
    
    public func delegate(delegate: CustomTableViewCellDelegate) {
        self.delegate = delegate
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.heartButton.addTarget(self, action: #selector(heartButtonPressed), for: .touchUpInside)
        contentView.addSubview(screen)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupCell(user: User) {
        viewModel = CustomTableViewCellViewModel(data: user)
        screen.userImageView.image = UIImage(systemName: viewModel?.getImageUser ?? "")
        screen.nameLabel.text = viewModel?.getName
        screen.ageLabel.text = viewModel?.getAge
        screen.salaryLabel.text = viewModel?.getSalary
        screen.professionLabel.text = viewModel?.getProfession
        
        if viewModel?.getIsEnableHeart ?? false {
            screen.heartButton.tintColor = .red
        } else {
            screen.heartButton.tintColor = .blue
        }
    }
    
    @objc func heartButtonPressed() {
        guard let viewModel else {
            return
        }
        
        if viewModel.getIsEnableHeart {
            screen.heartButton.tintColor = .blue
            viewModel.exchangeHeartState(false)
        } else {
            screen.heartButton.tintColor = .red
            viewModel.exchangeHeartState(true)
        }
        
        self.delegate?.heartButtonPressed(viewModel.getUser)
    }
}
