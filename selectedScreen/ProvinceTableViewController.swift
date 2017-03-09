//
//  ProvinceTableViewController.swift
//  selectedScreen
//
//  Created by Godfather on 3/8/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit

class ProvinceTableViewController: UITableViewController {
    
    var listProvince = [String]()
    var data:[City] = [City]()
    var nameKey: String?
    let dataService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromPlist()
    }
    
    func loadDataFromPlist() {
        data = dataService.getDataFromCopyFile()
        guard let nameKey = nameKey else {return}
        for i in data {
            if nameKey == i.name {
                listProvince = i.districts
            }
        }
        guard let oldSelected = UserDefaults.standard.object(forKey: "selectedCell") as? String else { return }
        print("Lựa chọn trước đó là: \(oldSelected)")
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
        return listProvince.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listProvince[indexPath.row]
        return cell
    }
    
    // MARK: Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = listProvince[indexPath.row]
        UserDefaults.standard.set(selected, forKey: "selectedCell")
    }
}
