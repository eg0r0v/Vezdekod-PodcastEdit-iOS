//
//  UIColor+RGB.swift
//  VK-Egorov
//
//  Created by Илья Егоров on 28.02.2020.
//  Copyright © 2020 Илья Егоров. All rights reserved.
//

import UIKit

extension UIColor {

    static let vkBlueTintColor = UIColor(r: 63, g: 138, b: 224)
    static let lightGrayCaptionColor = UIColor(r: 129, g: 140, b: 153)
    static let vkGrayTintColor = UIColor(r: 153, g: 162, b: 173)
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r) / 255,
                  green: CGFloat(g) / 255,
                  blue: CGFloat(b) / 255,
                  alpha: 1.0)
    }
}
