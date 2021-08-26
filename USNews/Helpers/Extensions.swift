//
//  Extensions.swift
//  USNews
//
//  Created by Fawaz Faiz on 25/08/2021.
//

import Foundation
import UIKit

extension UIImageView {
func imageFromURL(_ url: URL?) {
    if let uRl = url
    {
        DispatchQueue.global().async {
            if let data = try? Data( contentsOf:uRl)
            {
                DispatchQueue.main.async {
                    self.image = UIImage( data:data)
                }
            }
        }
    }
}
}


