//
//  GradientController.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-08-28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Pastel


class GradientController: UIViewController {
    fileprivate var colors: [UIColor]!
    fileprivate lazy var backgroundGradient: PastelView = {
        let view = PastelView()
        view.startPastelPoint = .bottomLeft
        view.endPastelPoint = .topRight
        view.animationDuration = 2.0
        view.setColors(self.colors)
        view.startAnimation()
        self.view.addSubview(view)
        return view
    }()

    init(colors: [UIColor]) {
        super.init(nibName: nil, bundle: nil)
        self.colors = colors
    }

    convenience init() {
        self.init(colors: [
            UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
            UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
            UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
            UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
            UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)
        ])
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundGradient.fillSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
