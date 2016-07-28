//
//  PersonBuilder.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Foundation
import Fakery

extension Person {
  convenience init(id: Int, name: String, ssn: String, birthDate: NSDate, deathDate: NSDate, sex: String) {
    self.init()
    self.id = id
    self.name = name
    self.ssn = ssn
    self.birthDate = birthDate
    self.deathDate = deathDate
    self.sex = sex
  }
}

class PersonBuilder {
  private let id = faker.number.increasingUniqueId()
  private let name = faker.name.name()
  private let ssn = faker.number.randomInt().description
  private let birthDate = NSDate()
  private let deathDate = NSDate()
  private let sex = "Female"

  func buildObject() -> Person {
    return Person(id: id, name: name, ssn: ssn, birthDate: birthDate, deathDate: deathDate, sex: sex)
  }
}

