//
//  CuisineRepository.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 07/12/22.
//

import Foundation
import RealmSwift

class CuisineLocalRepository : LocalRepository{
    
    override init(rFactory: RealmFactory) {
        super.init(rFactory: rFactory)
    }
    
    func saveCuisine(cuisine: Cuisines){
        rFactory.write(data: cuisine)
    }
    
    func saveCuisines(cuisines: Array<Cuisines>){
        rFactory.write(data: cuisines)
    }
    
    func removeAllCuisines(){
        rFactory.deleteAll(data: Cuisines.self)
    }
    
    func getAllCuisines()-> Array<Cuisines>{
        return rFactory.readAll(data: Cuisines.self)
    }
}
