//
//  ComposeViewController.swift
//  DelegatePatternExample
//
//  Created by dave76 on 09/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
  
  // MARK:- Property
  var delegate: ComposeDelegate?
  @IBOutlet var dataInputTextField: UITextField!
  
  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataInputTextField.delegate = self
  }
  
  // MARK:- IBActions
  
  @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
    doneTextInput()
    dismiss()
  }
  
  @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
    delegate?.composerDidCancel(self)
    dismiss()
  }

  
  // MARK:- Fileprivate Methods
  
  fileprivate func doneTextInput() {
    delegate?.composer(self, didInputNewValue: dataInputTextField.text)
  }
  
  fileprivate func dismiss() {
    dismiss(animated: true, completion: nil)
  }
}

// MARK:- Extension: UITextFieldDelegate
extension ComposeViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    doneTextInput()
    dataInputTextField.resignFirstResponder()
    dismiss()
    return true
  }
}
