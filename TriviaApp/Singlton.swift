//
//  Singlton.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import Foundation

import CoreData

@available(iOS 13.0, *)
class SingletonClass: NSObject {

    static let shared = SingletonClass()

    private override init() {
        // initializer code here
    }
    
    
  
}
