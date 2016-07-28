//
//  PersonDataTableViewController.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit

protocol CustomPersonDataEnumConvertible {
  static var all: Array<Int> { get }
}

class PersonDataTableViewController: UIViewController {

  enum PersonDataSection: Int, CustomPersonDataEnumConvertible {
    case info, date, sex

    static var all: Array<Int> {
      return [info.rawValue, date.rawValue, sex.rawValue]
    }
  }

  enum InfoSection: Int, CustomStringConvertible, CustomPersonDataEnumConvertible {
    case ssn, name

    static var all: Array<Int> {
      return [ssn.rawValue, ssn.rawValue]
    }

    var description: String {
      switch self {
      case .ssn: return "SSN"
      case .name: return "Name"
      }
    }
  }

  enum DateSection: Int, CustomStringConvertible, CustomPersonDataEnumConvertible {
    case birthDate, deathDate

    static var all: Array<Int> {
      return [birthDate.rawValue, deathDate.rawValue]
    }

    var description: String {
      switch self {
      case .birthDate: return "Birth Date"
      case .deathDate: return "Death Date"
      }
    }
  }

  enum SexSection: Int, CustomStringConvertible, CustomPersonDataEnumConvertible {
    case sex

    static var all: Array<Int> {
      return [sex.rawValue]
    }

    var description: String {
      switch self {
      case .sex: return "Sex"
      }
    }
  }

  let PersonDetailsTextInputTableViewCell = "PersonDetailsTextInputTableViewCell"

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    initTableView()
  }

  private func initTableView() {
    tableView.registerNib(UINib(nibName: String(PersonDetailsSexInputTableViewCell), bundle: NSBundle.mainBundle()), forCellReuseIdentifier: String(PersonDetailsSexInputTableViewCell))
    tableView.registerNib(UINib(nibName: String(PersonDetailsDateInputTableViewCell), bundle: NSBundle.mainBundle()), forCellReuseIdentifier: String(PersonDetailsDateInputTableViewCell))
    tableView.accessibilityLabel = "Person Details: Table View Accessibility Label"
    tableView.accessibilityIdentifier = "Person Details: Table View Accessibility Identifier"
  }
}

extension PersonDataTableViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return PersonDataSection.all.count
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch PersonDataSection(rawValue: section) {
    case .Some(.info) : return InfoSection.all.count
    case .Some(.date) : return DateSection.all.count
    case .Some(.sex) : return SexSection.all.count
    default: return 0
    }
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    switch PersonDataSection(rawValue: indexPath.section) {
    case .Some(.info) : return infosCellForIndexPath(indexPath)
    case .Some(.date) : return datesCellForIndexPath(indexPath)
    case .Some(.sex) : return sexCellForIndexPath(indexPath)

    default: return UITableViewCell()
    }
  }

  private func infosCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(PersonDetailsTextInputTableViewCell, forIndexPath: indexPath)
//    var textLabel: String?
//    var valueLabel: String?
//
//    let infoRow = InfoSection(rawValue: indexPath.row)
//    switch infoRow {
//    case .Some(.name):
//      textLabel = infoRow!.description
//    case .Some(.ssn):
//      textLabel = infoRow!.description
//    default:
//      textLabel = ""
//    }

    cell.textLabel?.text = InfoSection(rawValue: indexPath.row)?.description
    return cell
  }

  private func datesCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(String(PersonDetailsDateInputTableViewCell), forIndexPath: indexPath) as! PersonDetailsDateInputTableViewCell
//    var textLabel: String?
//    var valueLabel: String?

//    let dateRow = DateSection(rawValue: indexPath.row)
//    switch dateRow {
//    case .Some(.birthDate):
//      textLabel = dateRow!.description
//    case .Some(.deathDate):
//      textLabel = dateRow!.description
//    default:
//      textLabel = ""
//    }
    cell.customLabel?.text = DateSection(rawValue: indexPath.row)?.description
    return cell
  }

  private func sexCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(String(PersonDetailsSexInputTableViewCell), forIndexPath: indexPath)
    return cell
  }
}

extension PersonDataTableViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let section = PersonDataSection(rawValue: indexPath.section)
    switch section {
    case .Some(.info) : handleInfoRowsForIndexPath(indexPath)
    case .Some(.date) : break
    case .Some(.sex) : break
    default: break
    }

  }

  private func handleInfoRowsForIndexPath(indexPath: NSIndexPath) {
    var oldValue: String?
    var newValue: String?

    let infoRow = InfoSection(rawValue: indexPath.row)
    switch infoRow {
    case .Some(.name):
      presentInputView("Enter Name", message: "Please enter his/her name!", placeHolder: nil, value: oldValue) { inputValue in
        newValue = inputValue
      }

    case .Some(.ssn):
      presentInputView("Enter SSN Number", message: "Please enter his/her SSN Number!", placeHolder: nil, value: oldValue) { inputValue in
        newValue = inputValue
      }
    default: break
    }
  }

  private func handleDatesRowsForIndexPath(indexPath: NSIndexPath) {
    var oldValue: NSDate?
    var newValue: NSDate?

    let dateRow = DateSection(rawValue: indexPath.row)
    switch dateRow {
    case .Some(.birthDate): break
    case .Some(.deathDate): break
    default: break
    }
  }

  private func presentInputView(title: String, message: String, placeHolder: String?, value: String?, completion: ((String) -> Void)?) {
    self.presentAlertTextField(title, message: message, value: value, textFieldPlaceHolder: placeHolder) { inputValue in
      completion?(inputValue)
    }
  }
}
