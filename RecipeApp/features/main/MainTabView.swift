//
//  MainTabView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 03/01/23.
//

import SwiftUI

struct MainTabView: View{
    
    @EnvironmentObject var navigationCoordinator: MainNavigationCoordinator
    var viewmodelFactory = ViewmodelFactory()
    @State var selection = 1
    
    var body: some View{
        TabView(selection: $selection){
            RecipeWithCuisines(recipeWithCuisineViewModel:viewmodelFactory.getRecipeWithCuisinesViewModel(navigationCordinator: navigationCoordinator))
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }
                .tag(0)
            VideoRecipeView(viewModel: viewmodelFactory.getVideoReciewViewModel())
                .tabItem {
                    Label("Videos", systemImage: "list.dash")
                }.tag(1)
            FavouriteRecipeListView(viewModel: viewmodelFactory.getFavListViewModel()).tabItem {
                Label("Fav", systemImage: "list.dash")
            }.tag(2)
            DummyView().tabItem {
                Label("Settings", systemImage: "list.dash")
            }.tag(3)
        }
        .toolbar{
            HStack{
                if(selection == 0){
                    Button(action: {
                        navigationCoordinator.moveToSearch()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
        }
        .navigationTitle(getTitle(forSelection: selection))
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

func getTitle(forSelection selection: Int) -> String {
    switch selection {
    case 0:
        return "Recipes For you"
    case 1:
        return "Videos For you"
    case 2:
        return "Your Favorites"
    case 3:
        return "Settings"
    default:
        return ""
    }
}

struct DummyView: View{
    var body: some View{
        Text("Favourites")
    }
}
