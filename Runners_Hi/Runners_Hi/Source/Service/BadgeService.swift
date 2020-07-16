//
//  BadgeService.swift
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
    
    func monthlyRankloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.badgeURL
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { response in
            switch response.result {

            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(RankingData.self, from: value)
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





