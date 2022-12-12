//
//  CustomTableViewCell.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 12/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    func setupCell(setup: Person) {
        userImageView.image = setup.imageUser
        nameLabel.text = "Nome: \(setup.name)"
        ageLabel.text = "Idade: \(String(setup.age))"
        salaryLabel.text = "Salário: \(setup.salary)"
        professionLabel.text = "Profissão: \(setup.profession)"
        
        if setup.isEnableHeat {
            heartButton.tintColor = .red
        } else {
            heartButton.tintColor = .blue
        }
    }
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        heartButton.tintColor = .red
    }
}
