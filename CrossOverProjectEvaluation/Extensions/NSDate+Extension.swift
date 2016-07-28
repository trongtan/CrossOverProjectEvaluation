//
//  NSDate+Extension.swift
//  TakeFods
//
//  Created by Tan Vu on 7/8/16.
//  Copyright © 2016 DevHack. All rights reserved.
//

import UIKit

let defaultDate = NSDate(timeIntervalSince1970: 0)

extension NSDate {
  func toDateString() -> String {
    if self == defaultDate {
      return ""
    } else {
      return TFDateFormatter.dateFormatter.stringFromDate(self)
    }
  }
}
