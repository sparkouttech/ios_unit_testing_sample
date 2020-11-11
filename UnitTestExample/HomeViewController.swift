//
//  HomeViewController.swift
//  UnitTestExample
//
//  Created by Keerthi on 26/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class HomeViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoryLeakSample1()
    }
    
    fileprivate func memoryLeakSample1() {
        // Do any additional setup after loading the view.
        let parent = Parent(name: "Kim", child: nil)
        let child = Child(name: "Jafari", parent: parent)
        parent.child = child
        print("called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // Analytics.setScreenName("Home", screenClass: "HomeViewController")
    }
    
    @IBAction func customEventAction(_ sender: UIButton) {
        
      //  Analytics.logEvent("payment_screen", parameters: ["payment_status": "done", "amount": 400, "device": "iphone 6"])
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
