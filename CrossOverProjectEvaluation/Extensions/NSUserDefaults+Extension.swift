//
//  NSUserDefaults+Extension.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import Foundation

extension NSUserDefaults {
  func clean() {
    if let bundleIdentifier = NSBundle.mainBundle().bundleIdentifier {
      removePersistentDomainForName(bundleIdentifier)
    }
  }
}

