//
//  MainTabBarController.swift
//  SwiftyMenuBar
//
//  Created by Jonathan Scala on 08/27/2019.
//  Copyright (c) 2019 Jonathan Scala. All rights reserved.
//

import UIKit
import SwiftyMenuBar


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tab1 = Navigation()
        let tab2 = Navigation()
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .lightBlue
        self.tabBar.unselectedItemTintColor = .unselectedGray

        tab1.tabBarItem.image = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: .black, size: CGSize(width: 30, height: 30))
        tab2.tabBarItem.image = UIImage.fontAwesomeIcon(name: .shoppingBasket, style: .solid, textColor: .black, size: CGSize(width: 30, height: 30))

        self.viewControllers = [
            UINavigationController(rootViewController: tab1),
            UINavigationController(rootViewController: tab2)
        ]
    }
}
