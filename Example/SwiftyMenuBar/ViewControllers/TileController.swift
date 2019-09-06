//
//  TileController.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


class TileController: UICollectionViewController {
    fileprivate var numberOfItemsPerRow: CGFloat!
    fileprivate var datasource: Gallery?
    fileprivate var tileType: TileType?
    public var spacing: CGFloat = 15 {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    convenience init(numberOfItemsPerRow: CGFloat, datasource: Gallery?, tileType: TileType) {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.numberOfItemsPerRow = numberOfItemsPerRow
        self.datasource = datasource
        self.tileType = tileType
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: spacing * 2, left: spacing, bottom: spacing, right: spacing)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .darkThemeSurface
        collectionView.register(TileCell.self, forCellWithReuseIdentifier: TileCell.reuseIdentifier)
        collectionView.dataSource = self
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch tileType! {
        case .city:
            return datasource?.cities.count ?? 0
        case .country:
            return datasource?.countries.count ?? 0
        case .gallery:
            return datasource?.galleryImages.count ?? 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCell.reuseIdentifier, for: indexPath) as? TileCell else { return UICollectionViewCell() }
        var title: String?
        var resourceName: String?
        switch tileType! {
        case .city:
            title = datasource?.cities[indexPath.row].city
            resourceName = datasource?.cities[indexPath.row].resourceName
        case .country:
            title = datasource?.countries[indexPath.row].country
            resourceName = datasource?.countries[indexPath.row].resourceName
        case .gallery:
            resourceName = datasource?.galleryImages[indexPath.row].resourceName
            cell.coverAlpha = 0
            //cell.imageContentMode = .scaleAspectFill
        }
        let image: UIImage? = resourceName != nil ? UIImage(named: resourceName!) : nil
        cell.configure(image: image, title: title)
        cell.backgroundColor = .darkThemePrimary
        if numberOfItemsPerRow == 1 { cell.font = UIFont.systemFont(ofSize: 25, weight: .bold) }
        if numberOfItemsPerRow > 2 { cell.font = UIFont.systemFont(ofSize: 40 / numberOfItemsPerRow, weight: .bold)}
        return cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacingBetweenCells: CGFloat = spacing
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
