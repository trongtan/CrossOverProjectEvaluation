//
//  RelationshipSpec.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

@testable import CrossOverProjectEvaluation
import Quick
import Nimble
import Mockingjay
import RealmSwift

class RelationshipSpec: BaseSpec {
  override func spec() {
    super.spec()
    let personBuilder = PersonBuilder()

    describe("convenient init") {
      let relationshipName = "Brother"
      let person = personBuilder.buildObject()
      var relationship: Relationship?

      context("don't have parent value") {
        beforeEach {
          relationship = Relationship(name: relationshipName, person: person, parent: nil)
        }

        it("returns new relation ship") {
          expect(relationship?.name).to(equal(relationshipName))
          expect(relationship?.personRawValue).to(equal(person.id))
          expect(relationship?.parentRawValue).to(equal(0))
          expect(relationship?.path).to(equal("1"))
        }
      }

      context("have parent value") {
        let parentRelationship = RelationshipBuilder().buildObject()
        parentRelationship.save()
        let relationshipBuilder = RelationshipBuilder()

        beforeEach {
          relationshipBuilder.relationshipName = relationshipName
          relationshipBuilder.parentRelationship = parentRelationship
          relationshipBuilder.person = person

          relationship = relationshipBuilder.buildObject()
          relationship?.save()
        }

        it("returns new relation ship") {
          expect(relationship?.name).to(equal(relationshipName))
          expect(relationship?.parentRawValue).to(equal(parentRelationship.id))
          expect(relationship?.personRawValue).to(equal(person.id))
          expect(relationship?.path).to(equal("\(parentRelationship.id)\(separatorCharactor)\(relationship!.id)"))
        }
      }
    }
  }
}
