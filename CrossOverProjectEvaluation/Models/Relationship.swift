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

let separatorCharactor = "-"

class Relationship: Object, Mappable {
  dynamic var id = 0
  dynamic var name = ""
  dynamic var personRawValue = 0
  dynamic var parentRawValue = 0
  dynamic var path = ""

  var children: List<Relationship> {
    let path = self.path + separatorCharactor
    let relationships = Object.all(Relationship).filter("path BEGINSWITH %@", path)
    let sameLevelChildrent = List<Relationship>()
    let level = relationships.map { $0.path.componentsSeparatedByString(separatorCharactor).count }.minElement()
    relationships.forEach {
      if $0.path.componentsSeparatedByString(separatorCharactor).count == level {
        sameLevelChildrent.append($0)
      }
    }
    return sameLevelChildrent
  }

  var parent: Relationship? {
    return self.realm?.objectForPrimaryKey(Relationship.self, key: parentRawValue)
  }

  var person: Person? {
     return self.realm?.objectForPrimaryKey(Person.self, key: personRawValue)
  }

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

  func incrementaID() -> Int{
    let realm = try! Realm()
    let RetNext: NSArray = Array(realm.objects(Relationship).sorted("id"))
    let last = RetNext.lastObject
    if RetNext.count > 0 {
      let valor = last?.valueForKey("id") as? Int
      return valor! + 1
    } else {
      return 1
    }
  }

  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    parentRawValue <- map["parentRawValue"]
    path <- map["path"]
  }

  convenience init(name: String, person: Person, parent: Relationship?) {
    self.init()
    self.name = name
    self.personRawValue = person.id
    self.id = self.incrementaID()
    if let parent = parent {
      self.parentRawValue = parent.id
      self.path = "\(parent.path)\(separatorCharactor)\(id)"
    } else {
      self.path = "\(self.id)"
    }
  }

  func addChild(child : Person) {
//    self.children.append(child)
  }

  func removeChild(child : Person) {
//    self.children = self.children.filter( {$0 !== child})
  }
}
