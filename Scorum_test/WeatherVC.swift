//
//  WeatherVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let needToShowTutorial = UserDefaults.standard.object(forKey: "user_have_seen_tutorial")
        if needToShowTutorial == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tutorialVC = storyBoard.instantiateViewController(withIdentifier: "TutorialFirstVC") as! TutorialFirstVC
            self.present(tutorialVC, animated: true, completion: nil)
        }
    }
    
}
