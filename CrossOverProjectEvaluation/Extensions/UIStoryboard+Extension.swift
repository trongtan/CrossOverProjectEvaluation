//
//  UIStoryboard+Extension.swift
//  MealPass
//
//  Created by Tan Vu on 5/17/16.
//  Copyright © 2016 Meal Pass. All rights reserved.
//

import UIKit

extension UIStoryboard {
  class func mainStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
  }
}
