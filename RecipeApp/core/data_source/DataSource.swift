//
//  DataSource.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 07/12/22.
//

import Foundation

protocol DataSource{
    
    associatedtype T
    associatedtype D
    
    func writeData(data: D)
    
    func readData() -> T
}
