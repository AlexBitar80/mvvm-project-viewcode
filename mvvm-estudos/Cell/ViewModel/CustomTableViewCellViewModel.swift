//
//  CustomTableViewCellViewModel.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 13/12/22.
//

import UIKit

enum DescriptionCustomCell: String {
    case name = "Nome: "
    case age = "Idade: "
    case profession = "Profissão: "
    case salary = "Salário: R$"
}

class CustomTableViewCellViewModel {
    
    private var data: User
    
    init(data: User) {
        self.data = data
    }
    
    public var getUser: User {
        return data
    }
    
    public var getImageUser: String {
        return data.imageUser ?? ""
    }
    
    public var getName: String {
        return DescriptionCustomCell.name.rawValue + (data.name ?? "")
    }
    
    public var getAge: String {
        return DescriptionCustomCell.age.rawValue + String(data.age)
    }
    
    public var getProfession: String {
        return DescriptionCustomCell.profession.rawValue + (data.profession ?? "")
    }
    
    public var getSalary: String {
        return DescriptionCustomCell.salary.rawValue + (data.salary ?? "")
    }
    
    public var getIsEnableHeart: Bool {
        return data.isEnableHeart ?? false
    }
    
    public func exchangeHeartState(_ value: Bool) {
        data.isEnableHeart = value
    }
}
