//
//  RealmFactory.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 31/12/22.
//

import Foundation
import RealmSwift

class RealmFactory{
    
    func getRealm() -> Realm?{
        return try? Realm()
    }
    
    func getFrozenRealm() -> Realm?{
        let realm = try? Realm()
        let frozenRealm = realm?.freeze()
        return frozenRealm
    }
    
    func write<T : Object>(data: T) {
        let realm = getRealm()
        try! realm?.write{
            realm?.add(data)
        }
    }
    
    func write<T : Object>(data: Array<T>) {
        let realm = getRealm()
        try! realm?.write{
            realm?.add(data)
        }
    }
    
    func readAll<T : Object>(data: T.Type) -> Array<T> {
        let realm = getFrozenRealm()
        let allValues = realm?.objects(T.self)
        return Array(allValues!)
    }
    
    func delete<T>(data: T) {
        
    }
    
    func deleteAll<T: Object>(data: T.Type) {
        let realm = getRealm()
        try! realm?.write({
            let allData = realm?.objects(data)
            realm?.delete(allData!)
        })
    }
}
