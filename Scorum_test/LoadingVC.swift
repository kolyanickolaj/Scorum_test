//
//  LoadingVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.disappear), name: Notification.Name("WeatherFetched"), object: nil)
    }
    
    @objc func disappear() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
