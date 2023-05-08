//
//  Splash.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 27/12/22.
//

import SwiftUI

struct SplashView : View{
    
    var viewModel : ContentViewModel
    
    var body: some View{
        VStack{
            Text("splash")
        }.onAppear{
            viewModel.initNavigation()
        }
    }
}
