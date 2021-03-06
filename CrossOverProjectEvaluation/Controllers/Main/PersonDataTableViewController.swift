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
  var person: Person = Person()

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

  @IBAction func saveButtonPressed(sender: AnyObject) {
    person.save()
    navigationController?.popToRootViewControllerAnimated(true)
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

    cell.textLabel?.text = InfoSection(rawValue: indexPath.row)?.description

    let infoRow = InfoSection(rawValue: indexPath.row)
    switch infoRow {
    case .Some(.name): cell.detailTextLabel?.text = person.name
    case .Some(.ssn): cell.detailTextLabel?.text = person.ssn
    default: break
    }

    return cell
  }

  private func datesCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(String(PersonDetailsDateInputTableViewCell), forIndexPath: indexPath) as! PersonDetailsDateInputTableViewCell
    cell.customLabel?.text = DateSection(rawValue: indexPath.row)?.description
    cell.delegate = self

    let dateRow = DateSection(rawValue: indexPath.row)
    switch dateRow {
    case .Some(.birthDate): cell.date = person.birthDate
    case .Some(.deathDate): cell.date = person.deathDate
    default: break
    }

    return cell
  }

  private func sexCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(String(PersonDetailsSexInputTableViewCell), forIndexPath: indexPath) as! PersonDetailsSexInputTableViewCell
    cell.delegate = self
    cell.sexSegment.selectedSegmentIndex = person.sex == "Male" ? 0 : 1
    return cell
  }
}

extension PersonDataTableViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let section = PersonDataSection(rawValue: indexPath.section)
    switch section {
    case .Some(.info) : handleInfoRowsForIndexPath(indexPath)
    default: break
    }

  }

  private func handleInfoRowsForIndexPath(indexPath: NSIndexPath) {
    let infoRow = InfoSection(rawValue: indexPath.row)
    switch infoRow {
    case .Some(.name):
      presentInputView("Enter Name", message: "Please enter his/her name!", placeHolder: nil, value: person.name) { inputValue in
        self.person.name = inputValue
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      }

    case .Some(.ssn):
      presentInputView("Enter SSN Number", message: "Please enter his/her SSN Number!", placeHolder: nil, value: person.ssn) { inputValue in
        self.person.ssn = inputValue
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      }
    default: break
    }
  }

  private func presentInputView(title: String, message: String, placeHolder: String?, value: String?, completion: ((String) -> Void)?) {
    self.presentAlertTextField(title, message: message, value: value, textFieldPlaceHolder: placeHolder) { inputValue in
      completion?(inputValue)
    }
  }
}

extension PersonDataTableViewController: PersonDetailsDateInputTableViewCellDelegate {
  func personDetailsDateInputTableViewCell(cell: PersonDetailsDateInputTableViewCell, didChangeDateValue date: NSDate) {
    if let indexPath = tableView.indexPathForCell(cell) {
      handleDatesRowsForIndexPath(indexPath, date: date)
    }
  }

  private func handleDatesRowsForIndexPath(indexPath: NSIndexPath, date: NSDate) {
    let dateRow = DateSection(rawValue: indexPath.row)
    switch dateRow {
    case .Some(.birthDate): self.person.birthDate = date
    case .Some(.deathDate): self.person.deathDate = date
    default: break
    }
  }
}

extension PersonDataTableViewController: PersonDetailsSexInputTableViewCellDelegate {
  func personDetailsSexInputTableViewCell(cell: PersonDetailsSexInputTableViewCell, didChangeValue value: String) {
    person.sex = value
  }
}
