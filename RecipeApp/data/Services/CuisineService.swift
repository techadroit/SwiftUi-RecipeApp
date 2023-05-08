//
//  CuisineService.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 24/02/22.
//

import Foundation

class CuisineService{
    
    let cuisineRepository: CuisineLocalRepository
    
    init(cuisineRepository: CuisineLocalRepository) {
        self.cuisineRepository = cuisineRepository
    }
    
    func saveCuisines(cuisines: Array<Cuisines>){
        cuisineRepository.removeAllCuisines()
        cuisineRepository.saveCuisines(cuisines:cuisines)
    }
    
    func isCuisineSelected() -> Bool{
        return cuisineRepository.getAllCuisines().count > 0
    }
    
    func getSupportedCuisine() async -> Array<String>{
        return [ "American",
                 "British",
                 "Chinese",
                 "European",
                 "French",
                 "Indian",
                 "Italian",
                 "Irish",
                 "Japanese",
                 "Mediterranean",
                 "Spanish",
                 "Thai"]
    }
}
