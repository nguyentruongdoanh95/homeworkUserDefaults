//
//  City.swift
//  selectedScreen
//
//  Created by Godfather on 3/9/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import Foundation


struct City {
    var name: String = ""
    var districts: [String] = []
    init(dict: Dictionary<String, Any>) {
        self.name = dict["name"] as! String
        if let district = dict["districts"] {
            self.districts = district as! Array
        }
    }
}
