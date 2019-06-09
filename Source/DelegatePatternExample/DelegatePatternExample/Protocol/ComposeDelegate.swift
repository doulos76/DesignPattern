//
//  ComposeDelegate.swift
//  DelegatePatternExample
//
//  Created by dave76 on 09/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

// MARK:- Protocol - ComposeDelegate

protocol ComposeDelegate {
  func composer(_ viewController: UIViewController, didInputNewValue value: String?)
  func composerDidCancel(_ viewController: UIViewController)
}
