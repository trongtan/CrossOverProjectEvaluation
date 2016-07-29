//
//  MainViewController.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit
import RATreeView
import Realm
import RealmSwift
import SnapKit

class MainViewController: UIViewController, RATreeViewDelegate, RATreeViewDataSource {
  var treeView: RATreeView?
  var data : [Relationship] = []
  var editButton : UIBarButtonItem!

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let relationship1 = Relationship(name: "self", person: Person(), parent: nil)
    relationship1.save()
    data = [relationship1]
    setupTreeView()


  }

  func setupTreeView() -> Void {
    treeView = RATreeView(frame: view.bounds)
    treeView?.registerNib(UINib.init(nibName: "TreeTableViewCell", bundle: nil), forCellReuseIdentifier: "TreeTableViewCell")
    treeView?.delegate = self
    treeView?.dataSource = self
    treeView?.treeFooterView = UIView()
    treeView?.backgroundColor = UIColor.clearColor()
    treeView?.expandRowForItem(data.first)
    view.addSubview(treeView!)
    treeView?.snp_makeConstraints { make in
      make.top.equalTo(74)
      make.bottom.equalTo(44)
      make.leading.trailing.equalTo(0)
    }
  }

  func updateNavigationBarButtons() -> Void {
    let systemItem = ((treeView?.editing) != nil) ? UIBarButtonSystemItem.Done : UIBarButtonSystemItem.Edit;
    self.editButton = UIBarButtonItem.init(barButtonSystemItem: systemItem, target: self, action: #selector(editButtonTapped(_:)))
    self.navigationItem.rightBarButtonItem = self.editButton;
  }

  func editButtonTapped(sender : AnyObject) -> Void {
    treeView?.setEditing(!treeView!.editing, animated: true)
    updateNavigationBarButtons()
  }


  //MARK: RATreeView data source

  func treeView(treeView: RATreeView, numberOfChildrenOfItem item: AnyObject?) -> Int {
    if let item = item as? Relationship {
      return item.children.count
    } else {
      return self.data.count
    }
  }

  func treeView(treeView: RATreeView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
    if let item = item as? Relationship {
      return item.children[index]
    } else {
      return data[index] as Relationship
    }
  }

  func treeView(treeView: RATreeView, cellForItem item: AnyObject?) -> UITableViewCell {
    let cell = treeView.dequeueReusableCellWithIdentifier("TreeTableViewCell") as! TreeTableViewCell

    guard let item = item as? Relationship else { return cell }

    let level = treeView.levelForCellForItem(item)
    let title = "\(item.person!.name)(\(item.children.count))"
    let relationshipName = item.parent != nil ? "\(item.name)" : ""

    cell.selectionStyle = .None
    cell.setup(withTitle: title, detailsText: relationshipName, level: level, additionalButtonHidden: false)
    cell.additionButtonActionBlock = { [weak treeView] cell in
      guard let treeView = treeView, item = treeView.itemForCell(cell) as? Relationship else {
        return;
      }

      let newItem = Relationship(name: "self", person: Person(), parent: item)

      newItem.save()

      treeView.beginUpdates()
      treeView.insertItemsAtIndexes(NSIndexSet.init(index: 0), inParent: item, withAnimation: RATreeViewRowAnimationNone)
      treeView.endUpdates()
      treeView.reloadRowsForItems([item], withRowAnimation: RATreeViewRowAnimationAutomatic)
    }
    return cell
  }

  //MARK: RATreeView delegate

//  func treeView(treeView: RATreeView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowForItem item: AnyObject) {
//    guard editingStyle == .Delete else { return; }
//    let item = item as! Relationship
//    let parent = treeView.parentForItem(item) as? Relationship
//
//    var index = 0
//    if let parent = parent {
//      parent.children.indexOf({ dataObject in
//        return dataObject === item
//      })!
//      parent.removeChild(item)
//
//    } else {
//      index = self.data.indexOf({ dataObject in
//        return dataObject === item;
//      })!
//      self.data.removeAtIndex(index)
//    }
//
//    self.treeView!.deleteItemsAtIndexes(NSIndexSet.init(index: index), inParent: parent, withAnimation: RATreeViewRowAnimationRight)
//    if let parent = parent {
//      self.treeView!.reloadRowsForItems([parent], withRowAnimation: RATreeViewRowAnimationNone)
//    }
//  }
}

private extension MainViewController {

  static func commonInit() -> [Relationship] {
    let relationship1 = Relationship(name: "self", person: Person(), parent: nil)
    relationship1.save()
    let relationship2 = Relationship(name: "mother", person: Person(), parent: relationship1)
    relationship2.save()
    let relationship3 = Relationship(name: "father", person: Person(), parent: relationship1)
    relationship3.save()

    let relationship4 = Relationship(name: "sister", person: Person(), parent: relationship3)
    relationship4.save()

//    let phone1 = DataObject(name: "Phone 1")
//    let phone2 = DataObject(name: "Phone 2")
//    let phone3 = DataObject(name: "Phone 3")
//    let phone4 = DataObject(name: "Phone 4")
//    let phones = DataObject(name: "Phones", children: [phone1, phone2, phone3, phone4])
//
//    let notebook1 = DataObject(name: "Notebook 1")
//    let notebook2 = DataObject(name: "Notebook 2")
//
//    let computer1 = DataObject(name: "Computer 1", children: [notebook1, notebook2])
//    let computer2 = DataObject(name: "Computer 2")
//    let computer3 = DataObject(name: "Computer 3")
//    let computers = DataObject(name: "Computers", children: [computer1, computer2, computer3])
//
//    let cars = DataObject(name: "Cars")
//    let bikes = DataObject(name: "Bikes")
//    let houses = DataObject(name: "Houses")
//    let flats = DataObject(name: "Flats")
//    let motorbikes = DataObject(name: "motorbikes")
//    let drinks = DataObject(name: "Drinks")
//    let food = DataObject(name: "Food")
//    let sweets = DataObject(name: "Sweets")
//    let watches = DataObject(name: "Watches")
//    let walls = DataObject(name: "Walls")
//
    return [relationship1]
  }

}




