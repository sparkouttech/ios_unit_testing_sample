//
//  UIAlert+Extension.swift
//  UnitTestExample
//
//  Created by Hxtreme on 30/06/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func showSimpleAlert(_ vc: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        vc.present(alertController, animated: true, completion: nil)
    }
}
