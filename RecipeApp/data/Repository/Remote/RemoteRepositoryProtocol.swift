//
//  ServiceProtocol.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 21/03/22.
//

import Foundation
import Alamofire

protocol RemoteRepositoryProtocol{
    
    func makeRequest<T:Decodable>(
        of type: T.Type,
        path:String,
        param:[String:Any]) async throws -> T
}

extension RemoteRepositoryProtocol{
    
    func makeRequest<T:Decodable>(
        of type: T.Type = T.self,
        path: String,
        param: [String:Any]
    ) async throws -> T{
        let request = AF.request("https://api.spoonacular.com/"+path,parameters: param)
        
        return try await withCheckedThrowingContinuation({
            (continuation: CheckedContinuation<T,Error>) in
            request.responseDecodable(of: T.self){ (data) in
                guard let response : T = data.value else {
                    print("Error is")
                    print(data.error?.errorDescription)
                    continuation.resume(throwing: data.error!)
                    return
                }
                continuation.resume(returning:response)
            }
        })
    }

    func makeRequest1<T:Decodable>(
        of type: T.Type = T.self,
        path:String,
        param:[String:Any],
        onResponse: @escaping (T) -> Void
        ){
            let request = AF.request("https://api.spoonacular.com/"+path,parameters: param)
            
        request.responseDecodable(of: T.self){ (data) in
            guard let response : T = data.value else {
                print(data.error?.errorDescription)
                return
            }
            onResponse(response)
        }
    }
}
