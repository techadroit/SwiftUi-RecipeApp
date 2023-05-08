//
//  RecipeWithCuisines.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 17/03/22.
//

import SwiftUI
import NukeUI

struct RecipeWithCuisines: View {
    @StateObject var recipeWithCuisineViewModel: RecipeWithCuisinesViewModel
    var viewmodelFactory = ViewmodelFactory()
    @State var isActive: Bool = false
    @State private var isLoaded: Bool = false
    
    var body: some View {
        let recipeList = recipeWithCuisineViewModel.recipeList
        
        ScrollView{
            LazyVStack(alignment: .leading){
                ForEach(Array(recipeList.keys), id: \.self) { cuisine in
                    CuisineTitle(title: cuisine)
                    let list: Array<RecipeItem> = recipeList[cuisine]!
                    ScrollView(.horizontal,showsIndicators: false,content: {
                        LazyHStack{
                            ForEach(list) { list in
                                CuisineRecipeItemWithNavigation(recipeItem: list)
                            }
                            ViewAllWithNavigation(cuisine: cuisine)
                        }
                    })
                }
            }
        }.onAppear{
            if !isLoaded{
                isLoaded = true
                recipeWithCuisineViewModel.loadcuisine()
            }
        }.background(Color.BackgroundColor)
    }
}

struct CuisineRecipeItemWithNavigation : View{
    var recipeItem:RecipeItem
    var viewmodelFactory = ViewmodelFactory()
    @State var showDetail: Bool = false
    var body: some View{
        NavigationLink(isActive: $showDetail,destination:   {
            RecipeDetailView(viewModel:viewmodelFactory.getRecipeDetailViewModel())
                .navigationTitle(recipeItem.title)
        },label: {
            CuisineRecipeItem(recipeItem: recipeItem){ id in
                self.showDetail = true
            }
        })
    }
}

struct ViewAllWithNavigation : View{
    var cuisine:String
    var viewmodelFactory = ViewmodelFactory()
    @State var isActive: Bool = false
    var body: some View{
        
        NavigationLink(isActive: $isActive, destination: {
            RecipeListView(
                viewModel: viewmodelFactory.getRecipeListViewModel(),
                cuisine: cuisine
            ).navigationTitle(cuisine)
        }, label: {
            ViewAllView {
                self.isActive = true
            }
        })
    }
}

struct ViewAllView: View{
    
    var onTap: () -> Void
    
    var body: some View{
        Text("View All")
            .font(.largeTitle)
            .padding(.horizontal,10)
            .onTapGesture {
                self.onTap()
            }
    }
}

struct CuisineTitle: View{
    var title: String
    var body: some View{
        Text(title)
            .font(.largeTitle)
            .padding(.horizontal,10)
    }
}

struct CuisineRecipeItem: View{
    var recipeItem: RecipeItem
    var onTap: (String) -> Void
    var body: some View{
        VStack{
            LazyImage(url:URL(string: recipeItem.imageUrl))
                .frame(height: 240)
            Text(recipeItem.title)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .font(.body)
                .padding(.all,4)
        }
        .frame(maxHeight:.infinity)
        .frame(width: 200)
        .background(Color.BackgroundColorList)
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 2))
        .cornerRadius(12)
        .shadow(radius: 2)
        .onTapGesture {
            self.onTap(recipeItem.id)
        }
    }
}

//struct RecipeWithCuisines_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeWithCuisines()
//    }
//}
