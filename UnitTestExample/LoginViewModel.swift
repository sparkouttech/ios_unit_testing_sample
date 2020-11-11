//
//  LoginViewModel.swift
//  UnitTestExample
//
//  Created by Hxtreme on 30/06/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import Foundation
import UIKit

struct LoginViewModel {
    
    //MARK: - Variables
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var confirmPassword: String
    var isSignInActive: Bool {
        return checkEmptyFields()
    }
    
    
    // MARK: - Initialisation
    init() {
        firstName = ""
        lastName = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
    
    init(firstName: String, lastName: String, email: String, password: String, confirmPassword: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}

extension LoginViewModel {
    
    func checkEmptyFields() -> Bool {
        if firstName != "" && lastName != "" && email != "" && password != "" && confirmPassword != "" {
            return true
        } else {
            return false
        }
    }
    
    func isValidFirstName() -> Bool {
        return firstName.count > 3
    }
    
    func isValidLastName() -> Bool {
        return lastName.count > 3
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> String? {
        if self.password.count <= 1 {
            return "Please, enter a password"
        }
        
        if password.count < 6 {
            return "Password must not be shorter than 6 characters"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password) {
            return "Password must contain at least one uppercase letter"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password) {
            return "Password must contain at least one lowercase letter"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password) {
            return "Password must contain at least one number"
        }
        
        return nil
    }
    
    func doPasswordsMatch() -> Bool {
        return password == confirmPassword
    }

    func signUpAction(vc: UIViewController) {
        if self.checkEmptyFields() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please fill all Fields")
        } else if self.isValidFirstName() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid first name")
        } else if self.isValidLastName() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid last name")
        } else if self.isValidEmail() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid email")
        } else if let passwordError = isValidPassword(), passwordError != "" {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: passwordError)
        } else if self.doPasswordsMatch() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Password mismatched")
        } else {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Success",
                                              message: "Registered successfully")
        }
        
    }
}
