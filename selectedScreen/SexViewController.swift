//
//  SexViewController.swift
//  selectedScreen
//
//  Created by Godfather on 3/8/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit
import QuartzCore
class SexViewController: UIViewController {
    
    @IBOutlet weak var btnNam: UIButton!
    @IBOutlet weak var btnNu: UIButton!
    @IBOutlet weak var btnUnknown: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkStateWhenLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func checkStateWhenLoad() {
        guard let state = UserDefaults.standard.object(forKey: "tagButton") as? Int else { return }
        if state == 0 {
            switchImageWhenClickRadioButton(image1: UIImage(named: "checked"), image2: UIImage(named: "unchecked"), image3: UIImage(named: "unchecked"))
            print("Lựa chọn trước đó là: Nam")
        } else if state == 1 {
            switchImageWhenClickRadioButton(image1: UIImage(named: "unchecked"), image2: UIImage(named: "checked"), image3: UIImage(named: "unchecked"))
            print("Lựa chọn trước đó là: Nữ")
        } else {
            switchImageWhenClickRadioButton(image1: UIImage(named: "unchecked"), image2: UIImage(named: "unchecked"), image3: UIImage(named: "checked"))
            print("Lựa chọn trước đó là: Không xác định")
        }
    }
    
    private func switchImageWhenClickRadioButton(image1: UIImage?, image2: UIImage?, image3: UIImage?) {
        btnNam.setImage(image1, for: .normal)
        btnNu.setImage(image2, for: .normal)
        btnUnknown.setImage(image3, for: .normal)
        
    }
    
    @IBAction func radioButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            switchImageWhenClickRadioButton(image1: UIImage(named: "checked"), image2: UIImage(named: "unchecked"), image3: UIImage(named: "unchecked"))
        case 1:
            switchImageWhenClickRadioButton(image1: UIImage(named: "unchecked"), image2: UIImage(named: "checked"), image3: UIImage(named: "unchecked"))
        default:
            switchImageWhenClickRadioButton(image1: UIImage(named: "unchecked"), image2: UIImage(named: "unchecked"), image3: UIImage(named: "checked"))
        }
        UserDefaults.standard.set(sender.tag, forKey: "tagButton")
    }
    
    // MARK: Navigation
    

    
}

