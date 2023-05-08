//
//  VideoRecipeView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 09/01/23.
//

import SwiftUI
import NukeUI

struct VideoRecipeView: View{
    
    @StateObject var viewModel: VideoRecipeViewModel
    
    var body: some View {
        let videoList = viewModel.videoList
        
        ScrollView{
            LazyVStack{
                ForEach(videoList){ videoItem in
                    VideoItemView(videoItem: videoItem)
                        .onAppear{
                            viewModel.loadMoreItems(item: videoItem)
                        }
                }
            }
            if viewModel.loading == true {
                ProgressView()
            }
        }.onAppear{
            viewModel.loadVideoRecipes()
        }
    }
}

struct VideoItemView: View{
    var videoItem: VideoRecipeItem
    var body: some View{
        VStack{
            LazyImage(url:URL(string:  videoItem.thumbnail))
                .frame(height: 300)
            Text(videoItem.title)
                .frame(maxHeight: 20)
                .multilineTextAlignment(.leading)
                .font(.body)
        }
        .frame(width: .infinity)
        .padding(.horizontal,10)
    }
}
