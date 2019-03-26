//
//  WeatherVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationManager.shared.beginWork()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.fetchWeather), name: Notification.Name("NeedToFetchWeather"), object: nil)
        
        if LocationManager.shared.fetchedCity != "" {
            self.fetchWeather()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let needToShowTutorial = UserDefaults.standard.object(forKey: "user_have_seen_tutorial")
        if needToShowTutorial == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tutorialVC = storyBoard.instantiateViewController(withIdentifier: "TutorialFirstVC") as! TutorialFirstVC
            
            self.present(tutorialVC, animated: true, completion: nil)
        }
    }
    
    @objc func fetchWeather() {
        self.showLoadingView()
        WeatherManager.shared.fetchWeather(completion: {(Weather) in self.updateUI(Weather) } )
    }
    
    func updateUI(_ weather: Weather) {
        cityLabel.text = LocationManager.shared.fetchedCity
        weatherLabel.text = weather.weatherDescription
    }
    
    func showLoadingView(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loadingVC = storyBoard.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingVC
        
        loadingVC.modalPresentationStyle = .overCurrentContext
        present(loadingVC, animated: true, completion: nil)
    }
}
