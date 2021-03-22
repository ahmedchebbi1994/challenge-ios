//
//  ManagerBanksService.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import Foundation


protocol BanksServiceProtocol {
    func fetchAllBanks(path: String?, completion: @escaping (([Resource]) -> Void))
}

final class ManagerBanksService: ApiService, BanksServiceProtocol {
    
    
    static let shared = ManagerBanksService()
    
    
    
    
    
    func fetchAllBanks(path: String?, completion: @escaping (([Resource]) -> Void)) {
        
        loadData { (isValid, response) in
            if isValid {
                if let resources = response?.resources {
                    completion(resources)
                }
            } else {
                completion([])
            }
        }
        
    }
    
    fileprivate func loadData(path: String? = nil,completion: @escaping ( (Bool, ResponseListBanks?) -> Void )) {
        let params = [
            Path.QueryData.clientId.rawValue : Path.QueryData.clientIdValue.rawValue,
            Path.QueryData.clientSecret.rawValue : Path.QueryData.clientSecretValue.rawValue,
        ]
        var banksList: String = Path.BaseUrl.path.rawValue + Path.BaseUrl.subPath.rawValue
        if let path = path {
            banksList =  Path.BaseUrl.path.rawValue + path
        }
        if let request = self.configureRequest(parameters: params, url: URL(string: banksList)!, requestType: .get) {
            let task = URLSession.shared.dataTask(with: request) { data, response , error in
                if let httpResponse = response as? HTTPURLResponse {
                    let decoder = JSONDecoder()
                    guard let data = data, (httpResponse.statusCode == 200), let response = try? decoder.decode(ResponseListBanks.self, from: data) else {
                        completion(false,nil)
                        return
                    }
                    completion(true,response)

                } else {
                    completion(false,nil)
                }
            }
            task.resume()
        }
        
    }
    
    
    
    
    
}
