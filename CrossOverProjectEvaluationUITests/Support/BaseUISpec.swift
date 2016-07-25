//
//  BaseUISpec.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Quick
import Nimble
import Mockingjay
import KIF

class BaseUISpec: BaseSpec {
  private var getReservationStub: Stub!
  var kitchenStatusStub: Stub!

  override func setUp() {
    super.setUp()
    KIFTestCase.setUp()
  }

  override func tearDown() {
    super.tearDown()
    KIFTestCase.tearDown()
  }

  override func spec() {
    super.spec()

    beforeEach {
      self.tester().waitForAnimationsToFinish()
    }

    afterEach {
      self.tester().waitForAnimationsToFinish()
    }
  }
}
