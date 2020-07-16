//
//  RankingService.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
import Alamofire

struct RankingService {
    private init() {}
    static let shared = RankingService()
    
    func monthlyRankingloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.monthlyURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json", "token" : UserDefaults.standard.object(forKey: "token") as? String ?? " "]
       
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {

            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(RankingData<Monthly>.self, from: value)
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
    
    
    func winnerRankingloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.winnerURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json", "token" : UserDefaults.standard.object(forKey: "token") as? String ?? " "]
       
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {

            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(RankingData<Winner>.self, from: value)
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
    
    func loserRankingloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.loserURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json", "token" : UserDefaults.standard.object(forKey: "token") as? String ?? " "]
       
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {

            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(RankingData<Loser>.self, from: value)
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
    
    
    
    
}





