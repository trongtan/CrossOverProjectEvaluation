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

  static func mainViewController() -> MainViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(MainViewController)) as! MainViewController
  }

  static func menuViewController() -> MenuViewController {
    return UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier(String(MenuViewController)) as! MenuViewController
  }
}
