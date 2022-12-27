//
//  User.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 13/12/22.
//

import Foundation
import UIKit

struct UserResult: Decodable {
    var group: [User]
}

struct User: Decodable {
    var name: String?
    var age: Int
    var profession: String?
    var salary: String?
    var imageUser: String?
    var isEnableHeart: Bool?
    var identifier: Int?
}
