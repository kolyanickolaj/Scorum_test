//
//  TutorialFirstVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import UIKit

class TutorialFirstVC: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateUI), name: Notification.Name("AuthorisationSuccess"), object: nil)
    }
    
    @objc func updateUI() {
        if LocationManager.shared.authorised() {
            UserDefaults.standard.set(false, forKey: "user_have_seen_tutorial")
            
            nextButton.isHidden = false
        }
    }
    
}
