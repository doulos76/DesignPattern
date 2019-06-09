//
//  CustomViewController.swift
//  DelegatePatternExample
//
//  Created by dave76 on 09/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
  
  // MARK:- Property

  @IBOutlet var displayLabel: UILabel!
  
  // MARK:- View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentComposeViewController))
  }
  
  // MARK:- Methods
  
  @objc func presentComposeViewController() {
    performSegue(withIdentifier: "ComposeSegue", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let navController = segue.destination as? UINavigationController,
      let viewController = navController.topViewController as? ComposeViewController {
      viewController.delegate = self
    }
  }
}

// MARK:- Extension: ComposeDelegate

extension CustomViewController: ComposeDelegate {
  func composer(_ viewController: UIViewController, didInputNewValue value: String?) {
    displayLabel.text = value
  }
  
  func composerDidCancel(_ viewController: UIViewController) {
    displayLabel.text = "Cancel"
  }
}
