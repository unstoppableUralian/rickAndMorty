//
//  MainViewController.swift
//  RickAndMortyApp
//
//  Created by Русинов Евгений on 15.11.2023.
//

import UIKit
import SnapKit

/**
   TabBar для навигации в приложении 
 */

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    /// Метод настраивает TabBar
    private func setupTabBar() {
        
        let charactersTableViewController = CharactersViewController()
        let logOutViewController = LogOutViewController()
        
        viewControllers = [charactersTableViewController, logOutViewController]
        
        charactersTableViewController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "book"), tag: 0)
        logOutViewController.tabBarItem = UITabBarItem(title: "Logout", image: UIImage(systemName: "door.french.open"), tag: 1)
        
        self.navigationItem.hidesBackButton = true
    }
    
}
