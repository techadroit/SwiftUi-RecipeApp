//
//  Cuisines.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 31/03/22.
//

import Foundation
import RealmSwift

class Cuisines : Object{
    @Persisted var name:String
    @Persisted var isSelected:Bool
    
    override init() {
        super.init()
    }
    
    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}
