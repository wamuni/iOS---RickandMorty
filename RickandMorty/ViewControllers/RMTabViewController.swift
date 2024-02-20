//
//  ViewController.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import UIKit

class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupTabs()
    }
    
    private func setupTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingVC = RMSettingViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let characterNavigationItem = UINavigationController(rootViewController: characterVC)
        let locationNavigationItem = UINavigationController(rootViewController: locationVC)
        let episodeNavigationItem = UINavigationController(rootViewController: episodeVC)
        let settingNavigationItem = UINavigationController(rootViewController: settingVC)
        
        characterNavigationItem.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        locationNavigationItem.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 2)
        episodeNavigationItem.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 3)
        settingNavigationItem.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [characterNavigationItem, locationNavigationItem, episodeNavigationItem, settingNavigationItem] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([characterNavigationItem, locationNavigationItem, episodeNavigationItem, settingNavigationItem], animated: true)
    }

}

