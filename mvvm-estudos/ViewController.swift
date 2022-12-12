//
//  ViewController.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 12/12/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listUser: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        configureArrayUser()
    }
    
    func configureArrayUser() {
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: true))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
        listUser.append(Person(name: "Alexandre", age: 22, profession: "iOS Developer", salary: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeat: false))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
    
        cell?.setupCell(setup: listUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listUser[indexPath.row])
    }
}

struct Person {
    var name: String
    var age: Int
    var profession: String
    var salary: String
    var imageUser: UIImage
    var isEnableHeat: Bool
}
