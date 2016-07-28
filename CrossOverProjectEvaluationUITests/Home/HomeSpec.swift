//
//  HomeSpec.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Quick
import Nimble
import Fakery

class HomeSpec: BaseUISpec {
  override func spec() {
    super.spec()
    let tableViewAccessibilityLabel = "Person Details: Table View Accessibility Label"
    let tableViewAccessibilityIdentifier = "Person Details: Table View Accessibility Identifier"
    let alertTextField = "Alert Text Field"

    describe("there're no data on server") {
      beforeEach {
      }

      func checkUserInputLabelItems() {
        self.tester().waitForViewWithAccessibilityLabel(tableViewAccessibilityLabel)
        self.tester().waitForViewWithAccessibilityLabel("Name")
        self.tester().waitForViewWithAccessibilityLabel("SSN")
        self.tester().waitForViewWithAccessibilityLabel("Birth Date")
        self.tester().waitForViewWithAccessibilityLabel("Death Date")
        self.tester().waitForViewWithAccessibilityLabel("Sex")
      }

      func checkUserValues(name: String, ssn: String, birthDate: String, deathDate: String, sex: String) {
        self.tester().waitForViewWithAccessibilityLabel(name)
        self.tester().waitForViewWithAccessibilityLabel(ssn)
        self.tester().waitForViewWithAccessibilityLabel(birthDate)
        self.tester().waitForViewWithAccessibilityLabel(deathDate)
        let sexSegment = self.tester().waitForViewWithAccessibilityLabel("Person Details Sex Input Table View Cell : Sex Segment") as! UISegmentedControl
        expect(sexSegment.selectedSegmentIndex).to(equal(1))
      }

      context("user have never input their data before") {
        beforeEach {
        }

        it("opens user data input screen") {
          checkUserInputLabelItems()
        }
      }

      context("user input their valid infos") {
        func enterText(text: String) {
          self.tester().clearTextFromAndThenEnterText(text, intoViewWithAccessibilityLabel: alertTextField)
          self.tester().tapViewWithAccessibilityLabel("OK")
        }

        func enterPersonName(value: String) {
          self.tester().tapRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), inTableViewWithAccessibilityIdentifier: tableViewAccessibilityIdentifier)
          enterText(value)
        }

        func enterPersonSSN(value: String) {
          self.tester().tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableViewWithAccessibilityIdentifier: tableViewAccessibilityIdentifier)
          enterText(value)
        }

        func enterPersonBirthDate(values: [AnyObject]) {
          self.tester().tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 1), inTableViewWithAccessibilityIdentifier: tableViewAccessibilityIdentifier)
          self.tester().selectDatePickerValue(values)
        }

        func enterPersonDeathDate(values: [AnyObject]) {
          self.tester().tapRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1), inTableViewWithAccessibilityIdentifier: tableViewAccessibilityIdentifier)
          self.tester().selectDatePickerValue(values)
        }

        func enterPersonSex(value: String) {
          self.tester().tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 2), inTableViewWithAccessibilityIdentifier: tableViewAccessibilityIdentifier)
          self.tester().tapViewWithAccessibilityLabel(value)
        }

        let name = faker.name.name()
        let ssn = faker.number.increasingUniqueId()
        let sex = "Female"

        beforeEach {
          enterPersonName(name)
          enterPersonSSN("\(ssn)")
          enterPersonBirthDate(["July", "10", "1984"])
          enterPersonDeathDate(["July", "10", "2050"])
          enterPersonSex(sex)
          self.tester().tapViewWithAccessibilityLabel("Person Details: Save Button Accessibility Label")
        }

        it("create new person") {
          checkUserValues(name, ssn: "\(ssn)", birthDate: "Jul 10, 1984", deathDate: "Jul 10, 2050", sex: sex)
        }
      }
    }
  }
}
