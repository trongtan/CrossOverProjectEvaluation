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

    describe("Menu") {
      beforeEach {
      }

      context("click on the hamburger button") {
        beforeEach {
          self.tester().tapViewWithAccessibilityLabel("Main: Menu Button Accessibility Label")
        }

        it("open menu") {
          self.tester().waitForViewWithAccessibilityLabel("Menu")
        }
      }
    }
  }
}
