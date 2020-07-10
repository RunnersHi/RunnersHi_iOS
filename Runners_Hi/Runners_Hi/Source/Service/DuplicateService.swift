//
//  DuplicateService.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
import Alamofire

struct DuplicateService {
    static let shared = DuplicateService()
    
    private func makeParameter(_ check_name: String, _ flag: Int) -> Parameters {
        return ["check_name": check_name, "flag": flag]
    }
    
    func duplicate(check_name: String, flag: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.duplicateURL, method: .post, parameters: makeParameter(check_name, flag), encoding:
            JSONEncoding.default, headers: header)
        
        //데이터 통신
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    

    private func isUser(by data: Data) -> NetworkResult<Any> {
           let decoder = JSONDecoder()
           guard let decodedData = try? decoder.decode(DuplicateData.self, from: data) else { return .pathErr }
           //decoder.decode의 값이 존재하면 decodeDAta에 대입하고, 아니면 pathErr 리턴

        return .success(decodedData.success)
       }
}

