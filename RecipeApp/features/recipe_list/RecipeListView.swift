//
//  RecipeListView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 02/02/23.
//

import SwiftUI
import NukeUI

struct RecipeListView: View{
    
    @ObservedObject var viewModel: RecipeViewModel
    var cuisine:String
    
    var body: some View{
        let recipeList = viewModel.recipeList
        let columns = [GridItem(.flexible()), GridItem(.flexible())]

        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(recipeList){ item in
                    RecipeListItemView(recipeItem: item){ isSaved in
                        if(isSaved){
                            self.viewModel.saveRecipe(recipeItem: item)
                        }else{
                            self.viewModel.unsaveRecipe(recipeItem: item)
                        }
                    }
                    .background(Color.BackgroundColorList)
                    .padding(.all,8)
                    .cornerRadius(8)
                    .shadow(radius: 8)
                }
            }
        }
        .background(Color.BackgroundColor)
        .onAppear{
            viewModel.loadRecipes(cuisine: self.cuisine)
        }
    }
}

struct RecipeListItemView : View{
    var recipeItem: RecipeItem
    var OnTapListener: (Bool) -> Void

    var body: some View{
        VStack{
            LazyImage(url:URL(string: recipeItem.imageUrl))
                .frame(height: 240)
            HStack{
                Text(recipeItem.title)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                LikeButtonView(isSelected: recipeItem.isSaved) { isSelected in
                    self.OnTapListener(isSelected)
                }
            }.padding(8)
        }
        .frame(width: 220,height: 300)
    }
}

struct LikeButtonView : View{
    
    var isSelected: Bool
    var OnTapListener: (Bool) -> Void
    
    var body: some View{
         if isSelected {
             Image(systemName: "heart.fill")
                 .resizable()
                 .frame(width: 20,height: 20)
                 .onTapGesture {
                     OnTapListener(!isSelected)
                 }
        }else{
             Image(systemName:"heart")
                .resizable()
                .frame(width: 20,height: 20)
                .onTapGesture {
                    OnTapListener(!isSelected)
                }
        }
    }
}
