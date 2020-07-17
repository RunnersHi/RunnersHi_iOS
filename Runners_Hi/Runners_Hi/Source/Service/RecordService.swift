//
//  RecordService.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
import Alamofire

struct RecordService {
    private init() {}
    static let shared = RecordService()
    
    func recordloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.myrecordURL
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
                                let result = try decoder.decode(RecordAllData<Result>.self, from: value)
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
    func myrecordloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.recentURL
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
                                let result = try decoder.decode(RecentMyData<myRecent>.self, from: value)
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

    func yourrecordloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.opponentURL + "\(UserDefaults.standard.object(forKey: "runIdx") as? Int ?? 0)"
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
                                let result = try decoder.decode(RecentMyData<opponentRecent>.self, from: value)
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





