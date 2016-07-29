//
//  UINavigationController+Extension.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

extension UINavigationController {
//  class func rootNavigationController() -> UINavigationController? {
//    return (UIApplication.sharedApplication().delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController
//  }
//
//  class func homeNavigationController() -> UINavigationController? {
//    if let revealViewController = rootNavigationController()?.viewControllers.last as? SWRevealViewController {
//      if let navigationController = revealViewController.frontViewController as? UINavigationController {
//        return navigationController
//      }
//    }
//    return nil
//  }

  func redirectAfterAuthenticationAnimated(animated: Bool) {
//    if viewControllers.count == 0 {
//      // add signInViewController into viewControllers stack to pop back later on
//      pushViewController(UIViewController.signInViewController(), animated: false)
//    }
    pushViewController(UIViewController.containerViewController(), animated: animated)
  }
}
