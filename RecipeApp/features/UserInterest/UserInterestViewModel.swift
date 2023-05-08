//
//  UserInterestViewModel.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 24/02/22.
//

import Foundation

class UserInterestViewModel : BaseViewModel{
    
    private var cuisineService: CuisineService
    private var recipeService: RecipeRemoteRepository
    private var navigationCordinator: MainNavigationCoordinator

    @Published var cuisineList : Array<CuisineItem> = []
    @Published var showNextOption : Bool = false
    @Published var moveToApp: Bool = false
    
    init(cuisineService:CuisineService, recipeService: RecipeRemoteRepository, navigationCordinator: MainNavigationCoordinator){
        self.cuisineService = cuisineService
        self.recipeService = recipeService
        self.navigationCordinator = navigationCordinator
    }
    
    func getAllCuisine(){
        Task.init {
            let list : Array<String> =  await cuisineService.getSupportedCuisine()
            var cuisines: Array<CuisineItem> = []
            for item in list{
                cuisines.append(CuisineItem(cuisineName:item,isSelected:false))
            }
            cuisineList = cuisines
            recipeService.fetchRecipeWithCuisine()
        }
    }
    
    func selectChip(item: CuisineItem){
        let newList : Array<CuisineItem> = cuisineList.map { cItem in
            let newItem = cItem.self
            if(newItem.cuisineName == item.cuisineName){
                return CuisineItem(cuisineName: newItem.cuisineName, isSelected: true)
            }
            return newItem
        }
        cuisineList = newList
        enableNextOption()
    }
    
    func unselectChip(item: CuisineItem){
        let newList : Array<CuisineItem> = cuisineList.map { cItem in
            let newItem = cItem.self
            if(cItem.cuisineName == item.cuisineName){
                return CuisineItem(cuisineName: newItem.cuisineName, isSelected: false)
            }
            return newItem
        }
        cuisineList = newList
        enableNextOption()
    }
    
    func enableNextOption(){
        let count = cuisineList.filter{ item in
            item.isSelected
        }.count
        
        if count >= 5 {
            showNextOption = true
        }else {
            showNextOption = false
        }
    }
    
    func getSelectedCuisine() -> Array<Cuisines>{
        return cuisineList.filter{ item in
            item.isSelected
        }.map { cItem in
            Cuisines(name: cItem.cuisineName)
        }
    }
    
    func saveCuisines(){
        let list = getSelectedCuisine()
        cuisineService.saveCuisines(cuisines: list)
        navigationCordinator.moveToHome()
    }
}

struct UserInterstState : Hashable, Identifiable{
    var id = UUID()
    var cuisineList: Array<CuisineItem> = []
}

struct CuisineItem : Hashable,Identifiable,Codable{
    var id = UUID()
    let cuisineName:String
    let isSelected:Bool
}
