//
//  PersonDetailsDateInputTableViewCell.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

class PersonDetailsDateInputTableViewCell: UITableViewCell {
  @IBOutlet weak var customLabel: UILabel!
  @IBOutlet weak var dateTextField: UITextField!
  weak var date: NSDate?
  private let datePickerView = UIDatePicker()
  private let dateFormatter = NSDateFormatter()

  override func awakeFromNib() {
    super.awakeFromNib()
    configDateTextField()
    datePickerView.date = date ?? NSDate()
  }

  private func configDateTextField() {
    datePickerView.datePickerMode = UIDatePickerMode.Date
    dateTextField.inputView = datePickerView
    datePickerView.addTarget(self, action: #selector(datePickerValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
  }

  func datePickerValueChanged(sender:UIDatePicker) {
    dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
    dateTextField.text = dateFormatter.stringFromDate(sender.date)
    date = datePickerView.date
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    dateTextField.enabled = selected
    if selected {
      dateTextField.becomeFirstResponder()
    } else {
      dateTextField.resignFirstResponder()
    }
  }
}
