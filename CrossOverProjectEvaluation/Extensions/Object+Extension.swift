//
//  Object+Extension.swift
//  MealPass
//
//  Created by Tan Vu on 5/16/16.
//  Copyright © 2016 Meal Pass. All rights reserved.
//

import RealmSwift

extension Object {
  class func find<T: Object>(key: AnyObject) -> T? {
    return try! Realm().objectForPrimaryKey(T.self, key: key)
  }

  class func all<T: Object>(type: T.Type) -> Results<T> {
    return try! Realm().objects(type)
  }

  func save(closure: ((Realm) -> Void)? = nil) {
    let currentRealm: Realm = {
      if let realm = realm {
        return realm
      }
      return try! Realm()
    }()

    currentRealm.writeTransaction {
      closure?(currentRealm)
      currentRealm.add(self, update: true)
    }
  }
}
