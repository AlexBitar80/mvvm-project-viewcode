//
//  Service.swift
//  mvvm-estudos
//
//  Created by João Alexandre Bitar on 15/12/22.
//

import UIKit
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

protocol ServiceDelegate: GenericService {
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>)
    func getUser(completion: @escaping completion<UserResult?>)
}

class Service: ServiceDelegate {
    func getUser(completion: @escaping completion<UserResult?>) {
        let url: String = "https://run.mocky.io/v3/9806e8dd-3fbe-46f7-ac4a-5280f2d0d047"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: UserResult.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            return completion(nil, Error.fileNotFound(name: name))
        }
        
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: url)
            let user = try decoder.decode(UserResult.self, from: data)
            
            completion(user, nil)
        } catch {
            completion(nil, Error.fileDecodingFailed(name: name, error))
        }
    }
}
