//
//  TFDateFormatter.swift
//  TakeFods
//
//  Created by Tan Vu on 7/8/16.
//  Copyright © 2016 DevHack. All rights reserved.
//

import UIKit

class TFDateFormatter: NSDateFormatter {
  static let timeFormatter = TFDateFormatter(dateFormat: "HH:mm")
  static let dateFormatter = TFDateFormatter(dateFormat: "MMM dd, yyyy")
  static let serverResponseFormatter: TFDateFormatter = {
    let dateFormater = TFDateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss")
    dateFormater.timeZone = NSTimeZone(name: "UTC")
    return dateFormater
  }()

  convenience init(dateFormat: String) {
    self.init()
    self.dateFormat = dateFormat
  }
}
