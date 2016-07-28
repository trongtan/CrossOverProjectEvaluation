//
//  UIViewController+Extension.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

// MARK: AuthenticationStoryboard
extension UIViewController {
  static func signInViewController() -> SignInViewController {
    return UIStoryboard.authenticationStoryboard().instantiateViewControllerWithIdentifier(String(SignInViewController)) as! SignInViewController
  }
}

// MARK: MainStoryboard
extension UIViewController {
  static func containerViewController() -> ContainerViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(ContainerViewController)) as! ContainerViewController
  }

  static func tabBarViewController() -> TabBarViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(TabBarViewController)) as! TabBarViewController
  }

  static func mainViewController() -> MainViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(MainViewController)) as! MainViewController
  }

  static func menuViewController() -> MenuViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(MenuViewController)) as! MenuViewController
  }

  static func personDataTableViewController() -> PersonDataTableViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(PersonDataTableViewController)) as! PersonDataTableViewController
  }


}

// MARK: Utils funcs

extension UIViewController {
  func presentAlertTextField(title: String, message: String, titleButtonAction: String = "OK", value: String?, textFieldPlaceHolder: String? = "Enter text:", secureTextEntry: Bool = false, completion: ((String) -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: titleButtonAction, style: .Default) {
      _ in
      let textField = alert.textFields![0] as UITextField
      completion?(textField.text!)
    }

    alert.addAction(action)
    alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
      textField.placeholder = textFieldPlaceHolder
      textField.secureTextEntry = secureTextEntry
      textField.text = value
    })
    presentViewController(alert, animated: true, completion: nil)
  }

  func presentAlert(title: String, message: String, completion: ((Void) -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default) {
      _ in
      completion?()
    }
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  }
}
