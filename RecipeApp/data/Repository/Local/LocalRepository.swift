//
//  LocalRepository.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 31/03/22.
//

import Foundation
import RealmSwift

class LocalRepository{
    
    var rFactory: RealmFactory
    
    init(rFactory: RealmFactory) {
        self.rFactory = rFactory
    }
    
    func getDataAccess() -> Realm?{
        return try? rFactory.getRealm()
    }
    
    func getReadDataAccess() -> Realm?{
        return try? rFactory.getFrozenRealm()
    }
}
