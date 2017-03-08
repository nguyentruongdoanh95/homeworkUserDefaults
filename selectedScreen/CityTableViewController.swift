//
//  CityTableViewController.swift
//  selectedScreen
//
//  Created by Godfather on 3/8/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var listCity = [String]()
    let dataService = DataService()
    var userDefaults: UserDefaults?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromPlist()
        userDefaults = UserDefaults.standard
       
    }
    
    
    func loadDataFromPlist() {
        listCity = dataService.getDataTypeArray(nameSource: "City")
        guard let oldSelected = UserDefaults.standard.object(forKey: "selected") as? String else { return }
        print("Lựa chọn trước đó là: \(oldSelected)")
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let controller = segue.destination as? ProvinceTableViewController else { return }
        let seleted = listCity[indexPath.row]
        userDefaults?.set(seleted, forKey: "selected")
        switch indexPath.row {
        case 0:
            controller.nameKey =  "HN"
        default:
            controller.nameKey = "HCM"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listCity[indexPath.row]
        return cell
    }
    
}
