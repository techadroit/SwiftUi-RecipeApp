//
//  SearchView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 02/05/23.
//

import Foundation
import SwiftUI

struct SearchView : View{
    @ObservedObject var searchViewModel: SearchKeywordViewModel
    @State private var searchText = ""
    @FocusState private var isTextFieldFocused:Bool
    
    var body: some View{
        var list = searchViewModel.state
        ZStack(alignment: .top){
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search Recipes", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .focused($isTextFieldFocused)
                }
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                Spacer()
                List(list, id: \.self) { item in
                    Text(item)
                }
            }
        }.onChange(of: searchText, perform: { newValue in
            searchViewModel.getSearchKeywords(query: newValue)
        })
        .onAppear {
            DispatchQueue.main.async {
                isTextFieldFocused = true
            }
        }
    }
}

//struct SearchViewPreview : PreviewProvider{
//    static var previews: some View{
////        SearchView()
//    }
//}
