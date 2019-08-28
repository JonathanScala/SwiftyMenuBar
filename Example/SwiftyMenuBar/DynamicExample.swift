//
//  DynamicExample.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-08-28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyMenuBar


class Dynamic: UIViewController {
    fileprivate var menu: MenuBarController!
    fileprivate let titles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    fileprivate lazy var vcs: [UIViewController] = {
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        vc1.view.backgroundColor = .white
        vc2.view.backgroundColor = .red
        vc3.view.backgroundColor = .yellow
        vc4.view.backgroundColor = .magenta
        return [vc1, vc2, vc3, vc4]
    }()
    fileprivate lazy var configuration: MenuBarConfigurations = {
        let conf = MenuBarConfigurations()
        conf.itemsPerPage = 3.5
        conf.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        conf.barColor = .clear
        conf.textColor = .white
        conf.selectedColor = .white
        conf.staticSize = false
        conf.sliderColor = .clear
        return conf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightPurple
        menu = MenuBarController(viewControllers: vcs, titles: titles)
        menu.configuration = configuration
        addChild(menu)
        view.addSubview(menu.view)
        configureNavigationBar()
    }
    
    fileprivate func configureNavigationBar() {
        // Stop Seperation between bar extensionnav
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        
        // Configure Bar Button Items / Title
        let settingsImage = UIImage.fontAwesomeIcon(name: .bars, style: .solid, textColor: .gray, size: CGSize(width: 30, height: 30))
        let searchImage = UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: .gray, size: CGSize(width: 30, height: 30))

        navigationItem.title = "Home"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: nil)
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
