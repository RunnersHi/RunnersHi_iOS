//
//  SignUpService.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/12.
//  Copyright © 2020 김민희. All rights reserved.
//
import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService()
    private func makeParameter(_ id: String, _ password: String, _ nickname: String, _ gender: Int, _ level: Int, _ log_visibility: Bool, _ image: Int) -> Parameters {
        return ["id": id, "password": password, "nickname": nickname, "gender": gender, "level": level, "log_visibility": log_visibility, "image": image ]
    }//Request Body에 들어갈 parameter 생성, String으로 받은걸 list로 만들어주는 과정임;;
    
    func signup(id: String, password: String, nickname: String, gender: Int,  level: Int, log_visibility: Bool, image: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, password, nickname, gender, level, log_visibility, image), encoding: JSONEncoding.default, headers: header)
        
        //데이터 통신
        dataRequest.responseData { dataResponse in switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                //guard : dataResponse.response의 값이 존재하면 statusCode = dataResponse.response 선언을 하고, 아니면 그냥 리턴
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, _ result: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: result)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isUser(by result: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginData.self, from: result) else { return .pathErr }
        //decoder.decode의 값이 존재하면 decodeDAta에 대입하고, 아니면 pathErr 리턴
        return .success(decodedData.success)
    }
}
