
//  ContentView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 28/01/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationCoordinator: MainNavigationCoordinator
    var viewmodelFactory = ViewmodelFactory()
    
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink(destination: SplashView(viewModel:viewmodelFactory.getContentViewModel(navigationCordinator: navigationCoordinator))
                    .navigationTitle("Loading"),tag: "splash",selection: $navigationCoordinator.route){}
                NavigationLink(destination: UserInterestView(
                                    viewModel:viewmodelFactory.getUserInterestViewModel(navigationCordinator:navigationCoordinator))
                                    .environmentObject(navigationCoordinator)
                                    .navigationTitle("Select Atleast 5 Cuisines")
                                    .navigationBarTitleDisplayMode(.inline),
                               tag: "user_interest",
                               selection: $navigationCoordinator.route){}
                NavigationLink(destination: MainTabView()
                    .environmentObject(navigationCoordinator),
                               tag:"home",
                               selection: $navigationCoordinator.route){}
                NavigationLink(destination: SearchView(searchViewModel: viewmodelFactory.getSearchViewModel()),
                               tag:"search",
                               selection: $navigationCoordinator.route){}
            }
        }
    }
    
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
