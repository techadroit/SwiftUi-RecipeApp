//
//  RecipeService.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 30/12/22.
//

import Foundation
import Swift
import RealmSwift

class RecipeService{
    
    private var cuisineLocalRepository: CuisineLocalRepository
    private var recipeRemoteRepository: RecipeRemoteRepository
    private var recipeLocalRepository: RecipeLocalRepository
    
    init(cuisineLocalRepository: CuisineLocalRepository, recipeRemoteRepository: RecipeRemoteRepository, recipeLocalRepository: RecipeLocalRepository) {
        self.cuisineLocalRepository = cuisineLocalRepository
        self.recipeRemoteRepository = recipeRemoteRepository
        self.recipeLocalRepository = recipeLocalRepository
    }
    
    func searchForKeyword(keyword text:String) async throws -> Array<String>{
        var keywordResponse = try await recipeRemoteRepository.autoCompleteSearchFor(query: text)
        switch keywordResponse {
        case .success(let r): return r.map { item in
             item.title
        }
        default: throw CustomError.NoData
        }
    
    }
    
    func getAllFavouriteRecipes() async -> Array<RecipeItem>{
        var savedRecipes = recipeLocalRepository.getAllRecipes()
        return savedRecipes.map { r in
            r.toRecipeItem()
        }
    }
    
    func loadRecipesForAllCuisines()  async -> [String:Array<RecipeItem>]{
        var recipeList = [String:Array<RecipeItem>]()
        let result = cuisineLocalRepository.getAllCuisines()
        let cuisineList = Array(result)
        
        for cuisine in cuisineList {
            let cuisineName = cuisine.name
            do{
                let result = try await loadRecipesForCuisine(cuisine: cuisineName)
                recipeList[cuisineName] = result
            }catch{
                
            }
        }
        return recipeList
    }
    
    func loadRecipesForCuisine(cuisine:String) async throws -> Array<RecipeItem>  {
        let recipes = await recipeRemoteRepository.fetchRecipeWithCuisine(cuisine: cuisine)
        
        switch recipes{
        case .success(let r):
            let result = r.results.map({ Result in
                transformToRecipeItem(item:Result, baseUri: r.baseURI)
            })
            return result
        default:
            print(" the default is ")
            throw CustomError.NoData
        }
    }
    
    func loadVideoRecies(offset:Int) async -> [VideoRecipeItem]{
        var videoList = [VideoRecipeItem]()
        let response = await recipeRemoteRepository.fetchRecipeVideos(offset: offset)
        
        switch response{
        case .success(let res):
            videoList = transformToVideoItem(res: res.videos)
        default:
            print("video error")
        }
        return videoList
    }
    
    func fetchDetailFor(id:String) async -> RecipeDetailResponse?{
        let response = await recipeRemoteRepository.fetchRecipeDetail(id: id)
        switch response{
        case .success(let res):
            return res
        default:
            print("video error")
        }
        return nil
    }
    
    func transformToVideoItem(res:[VideoResponse]) -> [VideoRecipeItem]{
        let videoArrays = Array<VideoRecipeItem>()
        return res.map { vRes in
            VideoRecipeItem(title: vRes.shortTitle, youtubeId: vRes.youTubeID, thumbnail: vRes.thumbnail)
        }
    }
    
    func transformToRecipeItem(item:Result,baseUri:String) -> RecipeItem{
        let rItem = RecipeItem()
        rItem.id = String(item.id)
        rItem.title = item.title
        let image = item.image ?? ""
        rItem.imageUrl = baseUri+image
        return rItem
    }
}
