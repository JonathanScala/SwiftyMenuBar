//
//  CitiesController.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


class CitiesController: UICollectionViewController {
    fileprivate var datasource: [City]?

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    convenience init(datasource: [City]?) {
        self.init(collectionViewLayout: UltravisualLayout())
        self.datasource = datasource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.reuseIdentifier)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.reuseIdentifier, for: indexPath) as? CityCell, let city = datasource?[indexPath.row] else { return UICollectionViewCell() }

        let image: UIImage? = city.resourceName != nil ? UIImage(named: city.resourceName!) : nil
        cell.configure(city: city.city, country: city.country, image: image)
        return cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
