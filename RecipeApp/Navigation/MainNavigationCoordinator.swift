//
//  MainNavigationCoordinator.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 17/03/22.
//

import SwiftUI

class MainNavigationCoordinator : ObservableObject{
    @Published var route : String? = "splash"
    
    func moveToHome(){
        route = "home"
    }
    
    func moveToUserInterestView(){
        route = "user_interest"
    }
    
    func moveToRecipeList(){
        route = "recipe_list"
    }
    
    func moveToRecipeDetail(id:String){
        route = "recipe_detail"
    }
    
    func moveToSearch(){
        route = "search"
    }
}
