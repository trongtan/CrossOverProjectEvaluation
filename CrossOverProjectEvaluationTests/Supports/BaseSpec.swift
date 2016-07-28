//
//  BaseSpec.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Quick
import Nimble
import RealmSwift
import Fakery

let faker = Faker()
class BaseSpec: QuickSpec {
  override func setUp() {
    super.setUp()
    NSUserDefaults.standardUserDefaults().clean()
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
  }

  override func spec() {
    super.spec()

    beforeEach {
    }

    afterEach {
    }
  }
}