//
//  Relationship.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/28/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import ObjectMapper

class Relationship: Object, Mappable {
  dynamic var id = 0
  dynamic var name = ""
  dynamic var parentRawValue = 0
  dynamic var path = ""

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
    parentRawValue <- map["parentRawValue"]
    path <- map["path"]
  }
}
