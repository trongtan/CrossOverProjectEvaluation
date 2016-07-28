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

class HomeSpec: BaseUISpec {
  override func spec() {
    super.spec()
    let tableViewAccessibilityLabel = "Person Details: Table View Accessibility Label"
    let tableViewAccessibilityIdentifier = "Person Details: Table View Accessibility Identifier"

    describe("there're no data on server") {
      beforeEach {
      }

      func checkUserInputItems() {
        self.tester().waitForViewWithAccessibilityLabel(tableViewAccessibilityLabel)
        self.tester().waitForViewWithAccessibilityLabel("Name")
        self.tester().waitForViewWithAccessibilityLabel("SSN")
        self.tester().waitForViewWithAccessibilityLabel("Birth Date")
        self.tester().waitForViewWithAccessibilityLabel("Death Date")
        self.tester().waitForViewWithAccessibilityLabel("Sex")
      }

      context("user have never input their data before") {
        beforeEach {
        }

        it("opens user data input screen") {
          checkUserInputItems()
        }
      }
    }
  }
}
