//
//  File.swift
//  selectedScreen
//
//  Created by Godfather on 3/8/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit

class DataService: NSObject {
    static let instance = DataService()
    
    func getDataTypeDictionary(nameSource: String) -> [String: [String]] {
        let filePath = Bundle.main.path(forResource: nameSource, ofType: "plist")
        let dict = NSDictionary(contentsOfFile: filePath!) as! [String: [String]]
        return dict
    }
    
    func getDataTypeArray(nameSource: String) -> [String] {
        let filePath = Bundle.main.path(forResource: nameSource, ofType: "plist")
        let array = NSArray(contentsOfFile: filePath!) as! [String]
        return array
    }
}
