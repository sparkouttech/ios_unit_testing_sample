//
//  UIColor+Extension.swift
//  UnitTestExample
//
//  Created by Hxtreme on 05/07/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit

enum AssetsColor: String {
    case customBgColor
    case customBorderColor
}
extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor? {
     return UIColor(named: name.rawValue)
  }
}
