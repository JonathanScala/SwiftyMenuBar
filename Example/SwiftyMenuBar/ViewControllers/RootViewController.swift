//
//  RootViewController.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyMenuBar


class RootViewController: UIViewController {
    fileprivate var datasource: Gallery?
    fileprivate var menu: MenuBarController!
    fileprivate let titles = ["Cities", "Countries", "Gallery", "Tiles"]
    fileprivate lazy var vcs: [UIViewController] = {
        return [
            CitiesController(datasource: datasource?.cities),
            TileController(numberOfItemsPerRow: CGFloat(2), datasource: datasource, tileType: .country),
            TileController(numberOfItemsPerRow: CGFloat(1), datasource: datasource, tileType: .gallery),
            TileController(numberOfItemsPerRow: CGFloat(3), datasource: datasource, tileType: .gallery)
        ]
    }()

    fileprivate lazy var configuration: MenuBarConfigurations = {
        let config = MenuBarConfigurations()
        config.itemsPerPage = 3.5
        config.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        config.barColor = .darkThemePrimary
        config.textColor = .unselectedGray
        config.selectedColor = .white
        config.staticSize = true
        config.sliderColor = .white
        return config
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkThemePrimary
        Galleries.fetchGalleries { (gallery, error) in
            self.datasource = gallery
            self.menu = MenuBarController(viewControllers: self.vcs, titles: self.titles)
            self.menu.configuration = self.configuration
            self.addChild(self.menu)
            self.view.addSubview(self.menu.view)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
