//
//  NavigationExample.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-08-28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyMenuBar
import FontAwesome_swift


class Navigation: UIViewController {
    fileprivate var menu: MenuBarController!
    fileprivate let titles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    fileprivate lazy var vcs: [UIViewController] = {
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        vc1.view.backgroundColor = .backgroundBlue
        vc2.view.backgroundColor = .darkThemeLime
        vc3.view.backgroundColor = .darkThemePrimary
        vc4.view.backgroundColor = .darkThemeSurface
        return [vc1, vc2, vc3, vc4]
    }()
    fileprivate lazy var configuration: MenuBarConfigurations = {
        view.backgroundColor = .white
        let config = MenuBarConfigurations()
        config.itemsPerPage = 3.5
        config.font = UIFont.systemFont(ofSize: 15)
        config.barColor = .white
        config.textColor = .unselectedGray
        config.selectedColor = .lightBlue
        config.staticSize = true
        config.sliderColor = .lightBlue
        return config
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        menu = MenuBarController(viewControllers: vcs, titles: titles)
        menu.configuration = configuration
        addChild(menu)
        view.addSubview(menu.view)
    }

    fileprivate func configureNavBar() {
        let settingsImage = UIImage.fontAwesomeIcon(name: .bars, style: .solid, textColor: .gray, size: CGSize(width: 30, height: 30))
        let userImage = UIImage.fontAwesomeIcon(name: .userCircle, style: .solid, textColor: .gray, size: CGSize(width: 35, height: 35))
        navigationItem.title = "Title"
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .lightBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: nil)
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.gray]
    }
}
