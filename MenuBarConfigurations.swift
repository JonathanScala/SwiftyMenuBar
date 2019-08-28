//
//  MenuBarConfigurations.swift
//  SlidingMenuBar
//
//  Created by Jonathan Scala on 2019-08-26.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


public class MenuBarConfigurations {
    open var startIndexPath: IndexPath = IndexPath(row: 0, section: 0)
    open var selectedColor: UIColor = .black
    open var sliderColor: UIColor = .black
    open var barColor: UIColor = .white
    open var textColor: UIColor = .gray
    open var itemsPerPage: CGFloat = 3
    open var scrollPosition: UICollectionView.ScrollPosition = .centeredHorizontally
    open var font: UIFont = UIFont.systemFont(ofSize: 13)
    open var staticSize: Bool = true
}
