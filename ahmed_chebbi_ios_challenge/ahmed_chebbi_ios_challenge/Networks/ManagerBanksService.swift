//
//  ManagerBanksService.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import Foundation
import RxSwift

private typealias responseBanksDataCallBack = ( (Bool, ResponseListBanks?) -> Void )


protocol BanksServiceProtocol {
    func fetchAllBanks(path: String?) -> Observable<ResponseListBanks>
}

final class ManagerBankservice: ApiService, BanksServiceProtocol {

    
    static let shared = ManagerBankservice()
    
    let disposeBag = DisposeBag()
    
 
    func fetchAllBanks(path: String? = nil) -> Observable<ResponseListBanks> {
        return Observable.create {  observer -> Disposable in
            //?limit=100&client_id=dd6696c38b5148059ad9dedb408d6c84&client_secret=56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ
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
                            observer.onError(NSError(domain: "Error JSON or Network", code: httpResponse.statusCode, userInfo: nil))
                            return
                        }
                        observer.onNext(response)
                        observer.onCompleted()
                        return
                    } else {
                        observer.onError(NSError(domain: "Error Network", code: 404 , userInfo: nil))
                    }
                }
                task.resume()
                return Disposables.create{
                    task.cancel()
                }
            }
            return Disposables.create{
            }
        }
        
    }
    
 
    
}
