//
//  TutorialSecondVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//


import UIKit

class TutorialSecondVC: UIViewController {
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let weatherVC = storyBoard.instantiateViewController(withIdentifier: "WeatherVC") as! WeatherVC
        
        self.present(weatherVC, animated: true, completion: nil)

    }
}
