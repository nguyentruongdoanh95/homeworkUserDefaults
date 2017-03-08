//
//  AgeViewController.swift
//  selectedScreen
//
//  Created by Godfather on 3/8/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblAge: UILabel!
    var data = ["18","19","20","21","22"]
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let oldAge = UserDefaults.standard.object(forKey: "age") as? String else { return }
        if oldAge == "" {
            lblAge.text = "18 tuổi"
        } else {
            lblAge.text = "\(oldAge) tuổi"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension AgeViewController: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
}

extension AgeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblAge.text = "\(data[row]) tuổi"
        UserDefaults.standard.setValue(data[row], forKey: "age")
        
    }
}
