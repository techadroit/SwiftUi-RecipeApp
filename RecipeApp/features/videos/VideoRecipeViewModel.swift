//
//  VideoRecipeViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 09/01/23.
//

import Foundation

class VideoRecipeViewModel : BaseViewModel{
    
    private var recipeService: RecipeService
    @Published var videoList = [VideoRecipeItem]()
    @Published var loading = true
    var offset = 1
    
    init(recipeService: RecipeService) {
        self.recipeService = recipeService
    }
    
    func loadMoreItems(item:VideoRecipeItem){
        let threshold = self.videoList.index(self.videoList.endIndex, offsetBy: -1)
        let itemIndex = videoList.firstIndex { i in
            i.id == item.id
        }
        
        print("threshold is ",threshold," item index ",itemIndex)
        if(itemIndex == threshold){
            offset+=1
            loadVideoRecipes()
        }
    }
    
    func loadVideoRecipes(){
        showLoading()
        Task.init {
            do {
                let data = await recipeService.loadVideoRecies(offset: self.offset)
                DispatchQueue.main.async {
                    self.videoList.append(contentsOf: data)
                }
            } catch {
                
            }
        }
    }
    
    func showLoading(){
        loading = true
    }
    
    func hideLoading(){
        loading = false
    }
}
