//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Hxtreme on 30/06/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    
    //MARK: -
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet var collectionTextField: [UITextField]!
    @IBOutlet weak var signupButton: UIButton!
    
    fileprivate var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  Analytics.setScreenName("Login", screenClass: "ViewController")
    }
    
    fileprivate func setUpBindings() {
        // Do any additional setup after loading the view.
        for txt in self.collectionTextField {
            txt.delegate = self
            txt.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
            txt.layer.borderWidth = 1
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txt.frame.height))
            txt.leftViewMode = .always

        }
        signupButton.alpha = (viewModel.isSignInActive) ? 1 : 0.5
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
      //  viewModel.signUpAction(vc: self)
       
    }
    
}

extension ViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        switch textField {
        case firstNameTextField:
            self.viewModel.firstName = text ?? ""
        case lastNameTextField:
            self.viewModel.lastName = text ?? ""
        case emailTextField:
            self.viewModel.email = text ?? ""
        case passwordTextField:
            self.viewModel.password = text ?? ""
        case confirmPasswordTextField:
            self.viewModel.confirmPassword = text ?? ""
        default: break
        }
        signupButton.alpha = (viewModel.isSignInActive) ? 1 : 0.5
    }
}

extension ViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // You need to change the border color here
        for txt in self.collectionTextField {
            txt.layer.borderColor = UIColor.appColor(.customBorderColor)?.cgColor
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController").view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct ViewController_preview: PreviewProvider {
    static var previews: some View {
        ViewRepresentable().edgesIgnoringSafeArea(.all)
    }

}
#endif
