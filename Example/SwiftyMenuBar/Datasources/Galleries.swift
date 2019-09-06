//
//  Galleries.swift
//  SwiftyMenuBar_Example
//
//  Created by Jonathan Scala on 2019-09-06.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation


class Galleries {
    class func fetchGalleries(completion: @escaping (_ collections: Gallery?, _ error: Error?) -> Void) {
        guard let path = Bundle.main.path(forResource: "Galleries", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            ObjectifyJSON(json: data, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }

    fileprivate class func ObjectifyJSON<T: Decodable>(json: Data, completion: @escaping (_ collections: T?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let collection = try decoder.decode(T.self, from: json)
            // Pass the Decoded JSON as a Model
            DispatchQueue.main.async {
                completion(collection, nil)
            }
        } catch let error {
            print("Error Decoding JSON: \(error)")
            // Decoding Error
            completion(nil, error)
        }
    }
}
