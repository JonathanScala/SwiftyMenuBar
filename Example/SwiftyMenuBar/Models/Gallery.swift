//
//  Gallery.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation


struct Gallery: Codable {
    let cities: [City]
    let countries: [Country]
    let galleryImages: [GalleryImage]
}
