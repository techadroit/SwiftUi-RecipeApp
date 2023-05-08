//
//  RecipeItem.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 21/11/22.
//

import Foundation

class RecipeItem : Identifiable,ObservableObject{
    var title: String
    var imageUrl: String
    var id:String
    @Published var isSaved: Bool = false
    
    init(){
        title = ""
        imageUrl = ""
        id = ""
    }
    
    init(id:String,title:String,imageUrl:String){
        self.title = title
        self.imageUrl = imageUrl
        self.id = id
    }
}

extension RecipeItem{
    
    func toRecipeData() -> RecipeData{
        return RecipeData(id:id,title: title, imageUrl: imageUrl)
    }
}
