//
//  TileCell.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


class TileCell: UICollectionViewCell {
    static let reuseIdentifier = "cell"
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    fileprivate let coverView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    fileprivate let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    public var font: UIFont? {
        didSet {
            titleLabel.font = font
        }
    }

    public var coverAlpha: CGFloat? {
        didSet {
            if coverAlpha != nil {
                coverView.alpha = coverAlpha!
            }
        }
    }

    public var imageContentMode: UIView.ContentMode? {
        didSet {
            if imageContentMode != nil {
                imageView.contentMode = imageContentMode!
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(coverView)
        self.addSubview(titleLabel)
    }

    convenience init() {
        self.init(frame: .zero)
    }

    public func configure(image: UIImage?, title: String?) {
        titleLabel.text = title
        self.image = image
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        coverView.fillSuperview()
        imageView.fillSuperview()
        titleLabel.centerInSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
