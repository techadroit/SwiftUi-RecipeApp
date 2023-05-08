//
//  DataAccess.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 03/01/23.
//

import Foundation

protocol DataAccess{
    
    func write<T>(data: T)
    func write<T>(data: Array<T>)
    
    func read<T>()->Array<T>
    
    func delete<T>(data: T)
    func deleteAll<T>(data: T)
}
