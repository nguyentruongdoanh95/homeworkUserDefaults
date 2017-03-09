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
    

    
    func getDataFromCopyFile() -> [City]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var listCity = [City]()
        let filePath = appDelegate.path
        if let data = FileManager.default.contents(atPath: filePath) {
            do {
                if let result:[Dictionary<String, AnyObject>] =  try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [Dictionary<String, AnyObject>] {
                    for i in result {
                        listCity.append(City(dict: i))
                    }
                }
            } catch {
                print("Error")
            }
        }
       return listCity
    }
}
