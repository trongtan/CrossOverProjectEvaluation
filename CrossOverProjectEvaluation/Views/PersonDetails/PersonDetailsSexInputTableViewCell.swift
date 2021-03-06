//
//  PersonDetailsSexInputTableViewCell.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

protocol PersonDetailsSexInputTableViewCellDelegate: class {
  func personDetailsSexInputTableViewCell(cell: PersonDetailsSexInputTableViewCell, didChangeValue value: String)
}

class PersonDetailsSexInputTableViewCell: UITableViewCell {
  @IBOutlet weak var sexSegment: UISegmentedControl!

  weak var delegate: PersonDetailsSexInputTableViewCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    sexSegment.accessibilityLabel = "Person Details Sex Input Table View Cell : Sex Segment"
  }
  @IBAction func sexSegmentDidChangeValue(sender: UISegmentedControl) {
    delegate?.personDetailsSexInputTableViewCell(self, didChangeValue: sexSegment.titleForSegmentAtIndex(sender.selectedSegmentIndex)!)
  }
}
