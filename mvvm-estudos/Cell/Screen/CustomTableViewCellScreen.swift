//
//  CustomTableViewCellScreen.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 15/12/22.
//

import UIKit

class CustomTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.height / 2
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(userImageView)
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(professionLabel)
        addSubview(salaryLabel)
        addSubview(heartButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 4),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            ageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 4),
            
            professionLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 4),
            professionLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 4),
            professionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            salaryLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 4),
            salaryLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 4),
            salaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            heartButton.heightAnchor.constraint(equalToConstant: 24),
            heartButton.widthAnchor.constraint(equalToConstant: 28 ),
            heartButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            heartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
