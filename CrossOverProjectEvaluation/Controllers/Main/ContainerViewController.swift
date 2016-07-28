//
//  ContainerViewController.swift
//  CrossOverProjectEvaluation
//
//  Created by Tan Vu on 7/25/16.
//  Copyright © 2016 TanVu. All rights reserved.
//

import UIKit
import Foundation
import SlideMenuControllerSwift

class ContainerViewController: SlideMenuController {

  override func viewDidLoad() {
    super.viewDidLoad()
    configSlideMenu()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    setUpNavigationBar()
  }

  private func configSlideMenu() {
    self.mainViewController = UIViewController.personDataTableViewController()
    self.leftViewController = UIViewController.menuViewController()
    self.closeLeft()
    setUpMenuViewController()
  }

  private func setUpMenuViewController() {
    SlideMenuOptions.leftViewWidth = view.bounds.width * 0.8
    SlideMenuOptions.contentViewScale = 0.9
  }

  private func setUpNavigationBar() {
    navigationItem.setLeftBarButtonItem(initMenuBarButtonItem(), animated: true)
  }

  private func initMenuBarButtonItem() -> UIBarButtonItem {
    let menuButtonItem = UIBarButtonItem(image: UIImage(named: "MenuIcon"), style: .Plain, target: self, action: #selector(openLeft))
    menuButtonItem.accessibilityLabel = "Main: Menu Button Accessibility Label"
    return menuButtonItem
  }
}
