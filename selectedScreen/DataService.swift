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
    
    
    func getDataFromCopyFile(handler: (_ data: City) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let filePath = appDelegate.path
        if let data = FileManager.default.contents(atPath: filePath) {
            do {
                if let result:Array<Dictionary<String, AnyObject>> =  try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? Array<Dictionary<String, AnyObject>> {
                    for i in result {
                        handler(City(dict: i))
                    }
                }
            } catch {
                print("Error")
            }
        }
        
    }
    
}
