//
//  Parent.swift
//  UnitTestExample
//
//  Created by Keerthi on 11/09/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import Foundation

class Parent {
    var name: String
    // if weak does not appear in the declaration below, there will be a retain cycle
    weak var child: Child?
    init(name: String, child: Child? = nil) {
        self.name = name
        self.child = child
    }
}

class Child {
    var name: String
    var parent: Parent
    init(name: String, parent: Parent) {
        self.name = name
        self.parent = parent
    }
}
