//
//  RecipeData.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 18/01/23.
//

import Foundation
import RealmSwift

class RecipeData : Object{
    @Persisted var title:String
    @Persisted var imageUrl:String
    @Persisted var id:String
    
    override init() {
        super.init()
    }
    
    init(id:String,title:String, imageUrl:String){
        self.title = title
        self.imageUrl = imageUrl
    }
}

extension RecipeData{
    
    func toRecipeItem() -> RecipeItem{
        return RecipeItem(id:id,title:title,imageUrl:imageUrl)
    }
}
