//
//  RecipeDetailView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 03/03/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @ObservedObject var viewModel: RecipeDetailViewModel
    
    
    var body: some View {
        var recipeDetail = viewModel.recipeDetail
        ScrollView{
            Text(recipeDetail?.title ?? "")
        }.onAppear{
                viewModel.getDetailFor(id: "545398")
        }
    }
}

