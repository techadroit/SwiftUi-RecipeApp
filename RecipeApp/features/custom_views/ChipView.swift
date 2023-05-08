//
//  ChipView.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 24/02/22.
//

import SwiftUI

struct Chips: View {
    let titleKey: String
    @State var isSelected: Bool
    var operation: () -> Void

    init(titleKey:String,isSelected:Bool,operation: @escaping () -> Void) {
            self.operation = operation
        self.titleKey = titleKey
        self.isSelected = isSelected
        }
    
    var body: some View {
        HStack {
            Text(titleKey).font(.title3).lineLimit(1)
        }.padding(.all, 10)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(40)
        .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 1.5)
        
        ).onTapGesture {
            operation()
//            isSelected.toggle()
        }
    }
}


struct ChipView_Preview: PreviewProvider {
    static var previews: some View {
        HStack{
            Chips(titleKey: "Chinese", isSelected: false,operation:{})
            Chips(titleKey: "Chinese", isSelected: false,operation:{})
        }
    }
}
