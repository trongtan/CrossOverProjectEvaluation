//
//  PersonDetailsSexInputTableViewCell.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

class PersonDetailsSexInputTableViewCell: UITableViewCell {
  @IBOutlet weak var sexSegment: UISegmentedControl!

  @IBAction func sexSegmentDidChangeValue(sender: UISegmentedControl) {
    print(sexSegment.titleForSegmentAtIndex(sender.selectedSegmentIndex))
  }
}
