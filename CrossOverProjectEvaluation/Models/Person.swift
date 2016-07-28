//
//  Person.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import ObjectMapper
import CoreLocation

class Person: Object, Mappable {
  dynamic var id = 0
  dynamic var name = ""
  dynamic var ssn = ""
  dynamic var birthDate: NSDate?
  dynamic var deathDate: NSDate?
  dynamic var sex = ""

  required init() {
    super.init()
  }

  required convenience init?(_ map: Map) {
    self.init()
  }

  required init(value: AnyObject, schema: RLMSchema) {
    super.init(value: value, schema: schema)
  }

  required init(realm: RLMRealm, schema: RLMObjectSchema) {
    super.init(realm: realm, schema: schema)
  }

  override static func primaryKey() -> String? {
    return "id"
  }

  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    ssn <- map["ssn"]
    birthDate <- (map["birthDate"], DateFormatterTransform(dateFormatter: TFDateFormatter.serverResponseFormatter))
    deathDate <- (map["deathDate"], DateFormatterTransform(dateFormatter: TFDateFormatter.serverResponseFormatter))
    sex <- map["sex"]
  }
}
