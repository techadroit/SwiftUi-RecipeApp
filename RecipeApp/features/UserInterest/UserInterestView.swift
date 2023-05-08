//
//  UserInterestView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 17/03/22.
//

import Foundation
import SwiftUI

struct UserInterestView: View {
    
    @StateObject var viewModel: UserInterestViewModel
    @EnvironmentObject var navigateCoordinator: MainNavigationCoordinator
    
    var body: some View {
        let list = viewModel.cuisineList
        
        VStack{
            List(list){ item in
                VStack{
                    Chips(titleKey: item.cuisineName, isSelected: item.isSelected ,operation: {
                        if(item.isSelected){
                            viewModel.unselectChip(item: item)
                        }else{
                            viewModel.selectChip(item: item)
                        }
                    })
                }
            }
            
            if viewModel.showNextOption {
                NextOption{
                    viewModel.saveCuisines()
                }
            }
        }.onAppear{
            viewModel.getAllCuisine()
        }
    }
}



struct NextOption : View{
    
    var action: () -> Void
    
    init(action: @escaping () -> Void){
        self.action = action
    }
    
    var body: some View{
        Button(action: {
            self.action()
        }){
            Text("Next")
        }.buttonStyle(DefaultButtonStyle())
        
    }
}
