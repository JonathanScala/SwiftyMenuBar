//
//  ViewController.swift
//  SwiftyMenuBar
//
//  Created by Jonathan Scala on 08/27/2019.
//  Copyright (c) 2019 Jonathan Scala. All rights reserved.
//

import UIKit
import SwiftyMenuBar


class ViewController: UIViewController {
    fileprivate var menu: MenuBarController!
    fileprivate let titles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    fileprivate lazy var vcs: [UIViewController] = {
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        
        vc1.view.backgroundColor = .red
        vc2.view.backgroundColor = .green
        vc3.view.backgroundColor = .blue
        vc4.view.backgroundColor = .yellow
        return [vc1, vc2, vc3, vc4]
    }()

    fileprivate lazy var configuration1: MenuBarConfigurations = {
        let config = MenuBarConfigurations()
        config.itemsPerPage = 3.5
        config.font = UIFont.systemFont(ofSize: 20)
        config.barColor = .clear
        config.textColor = .white
        config.selectedColor = .white
        config.staticSize = false
        config.sliderColor = .clear
        return config
    }()

    fileprivate lazy var configuration2: MenuBarConfigurations = {
        view.backgroundColor = .white
        let config = MenuBarConfigurations()
        config.itemsPerPage = 3.5
        config.font = UIFont.systemFont(ofSize: 15)
        config.barColor = .white
        config.textColor = .gray
        config.selectedColor = .black
        config.staticSize = true
        config.sliderColor = .black
        return config
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        menu = MenuBarController(viewControllers: vcs, titles: titles)
        menu.configuration = configuration2
        addChild(menu)
        view.addSubview(menu.view)
    }
}
