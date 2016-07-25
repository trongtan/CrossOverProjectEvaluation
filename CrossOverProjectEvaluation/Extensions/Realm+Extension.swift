//
//  Realm+Extension.swift
//  MealPass
//
//  Created by Tan Vu on 5/16/16.
//  Copyright © 2016 Meal Pass. All rights reserved.
//

import RealmSwift

extension Realm {
  func writeTransaction(transaction: (() -> Void)) {
    if inWriteTransaction {
      transaction()
    } else {
      try! write {
        transaction()
      }
    }
  }

  class func writeTransaction(transaction: ((Realm) -> Void)) {
    let realm = try! Realm()
    realm.writeTransaction {
      transaction(realm)
    }
  }
}
