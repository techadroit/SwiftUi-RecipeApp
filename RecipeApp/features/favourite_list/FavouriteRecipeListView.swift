//
//  FavouriteRecipeListView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 03/03/23.
//

import SwiftUI

struct FavouriteRecipeListView: View {
    @ObservedObject var viewModel: FavouriteListViewModel
    
    var body: some View{
        let recipeList = viewModel.recipeList
        
        ScrollView{
            LazyVStack{
                ForEach(recipeList){ item in
                    RecipeListItemView(recipeItem: item){ isSaved in
                            self.viewModel.unsaveRecipe(recipeItem: item)
                    }
                }
            }
        }.onAppear{
            viewModel.loadRecipes()
        }
    }
}

