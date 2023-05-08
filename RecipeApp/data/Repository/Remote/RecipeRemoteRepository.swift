//
//  RecipeRemoteRepository.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 30/12/22.
//

import Foundation
import Alamofire

class RecipeRemoteRepository : RemoteRepositoryProtocol{
    
    let apiKey = "95aed809c8d84dd6b831b9aaa35c5f24"
    let number = 10
    let limitLicence = true
    
    func autoCompleteSearchFor(query:String) async -> Swift.Result<Array<SearchKeywordResponse>,Error>{
        let param :[String:Any] = ["query":query,"number":number,"apiKey":apiKey]
        do {
            let res = try await makeRequest(of:[SearchKeywordResponse].self,path: "recipes/autocomplete", param: param)
            return Swift.Result.success(res)
        } catch {
            return Swift.Result.failure(error)
        }
    }
    
    func fetchRecipeWithCuisine(cuisine:String,offset:Int = 1) async -> Swift.Result<RecipeWithCuisineResponse,Error>{
        
        let param :[String:Any] = ["limitLicense":limitLicence,"cuisine":cuisine,"offset":offset,"number":number,"apiKey":apiKey]
        do {
            let res = try await makeRequest(of:RecipeWithCuisineResponse.self,path: "recipes/search", param: param)
            return Swift.Result.success(res)
        } catch {
            return Swift.Result.failure(error)
        }
    }
    
    func fetchRecipeVideos(offset:Int)  async -> Swift.Result<VideoRecipesResponse,Error>{
        let param :[String:Any] = ["limitLicense":limitLicence,"cuisine":"french","offset":offset,"number":number,"apiKey":apiKey]
        do {
            let res = try await makeRequest(of:VideoRecipesResponse.self,path: "food/videos/search", param: param)
            return Swift.Result.success(res)
        } catch {
            return Swift.Result.failure(error)
        }
    }
    
    func fetchRecipeDetail(id:String)  async -> Swift.Result<RecipeDetailResponse,Error>{
        let param :[String:Any] = ["apiKey":apiKey]
        do {
            let res = try await makeRequest(of:RecipeDetailResponse.self,path: "recipes/"+id+"/information", param: param)
            return Swift.Result.success(res)
        } catch {
            return Swift.Result.failure(error)
        }
    }
    
    func fetchRecipeWithCuisine(){
        
    }
}
