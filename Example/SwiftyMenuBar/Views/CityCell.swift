//
//  CityCell.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


class CityCell: UICollectionViewCell {
    static let reuseIdentifier = "galleryCell"
    fileprivate lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    fileprivate lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    fileprivate lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    fileprivate lazy var imageCoverView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    public func configure(city: String?, country: String?, image: UIImage?) {
        cityLabel.text = city
        countryLabel.text = country
        self.image = image
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(imageCoverView)
        addSubview(cityLabel)
        addSubview(countryLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.fillSuperview()
        imageCoverView.fillSuperview()
        
        cityLabel.centerInSuperview()
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        countryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        countryLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        countryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75

        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        let scale = max(delta, 0.5)
        cityLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        countryLabel.alpha = delta
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
