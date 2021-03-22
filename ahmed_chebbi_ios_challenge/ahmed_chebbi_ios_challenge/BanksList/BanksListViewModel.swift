//
//  BanksListViewModel.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import Foundation

struct BanksListViewModel {
    
    private let service : BanksServiceProtocol
    var coordinator: BanksListCoordinator?
    
    init(service: BanksServiceProtocol = ManagerBanksService()){
        self.service = service
    }
    
    init(service: BanksServiceProtocol = ManagerBanksService.shared ,coordinator: BanksListCoordinator) {
        self.service = service
        self.coordinator = coordinator
        
        
    }
    
    func fetchAllBanks(completion: @escaping ([ResourceViewModel]) -> Void) {
        
        service.fetchAllBanks(path: nil) { (resources) in
            var data: [ResourceViewModel] = []
            resources.forEach { (resource) in
                if let code = resource.countryCode, let parentBanks = resource.parentBanks {
                    data.append(ResourceViewModel(code: code, bank: parentBanks))
                }
            }
            completion(data)
        }
 
        
    }
    
}
