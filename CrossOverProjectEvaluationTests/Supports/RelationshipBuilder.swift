//
//  RelationshipBuilder.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Foundation
import Fakery

extension Relationship {
  convenience init(id: Int) {
    self.init()
    self.id = id
  }
}

class RelationshipBuilder {
  var relationshipName = faker.name.firstName()
  var person = PersonBuilder().buildObject()
  var parentRelationship: Relationship?

  func buildObject() -> Relationship {
    let relationShip = Relationship(name: relationshipName, person: person, parent: parentRelationship)
    return relationShip
  }
}
