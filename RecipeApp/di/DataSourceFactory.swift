//
//  DataSourceFactory.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 08/12/22.
//

import Foundation
import RealmSwift

class DataSourceFactory{
    
    func getRealmFactory() -> RealmFactory{
        return RealmFactory()
    }
    
    func getCuisineRepository() -> CuisineLocalRepository{
        return CuisineLocalRepository(rFactory: getRealmFactory())
    }
    
    func getRecipeRemoteRepository() -> RecipeRemoteRepository{
        return RecipeRemoteRepository()
    }
    
    func getLocalRepository() -> RecipeLocalRepository{
        return RecipeLocalRepository(rFactory: getRealmFactory())
    }
}
