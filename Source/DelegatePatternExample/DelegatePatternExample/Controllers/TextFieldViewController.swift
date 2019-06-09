//
//  TextFieldViewController.swift
//  DelegatePatternExample
//
//  Created by dave76 on 09/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {
  
  // MARK:- View Life Cycle
  @IBOutlet var idTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    idTextField.delegate = self
    passwordTextField.delegate = self
  }
}

extension TextFieldViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("\n================[textFieldShouldBeginEditing]================\n")
    return true
  }
  

  func textFieldDidBeginEditing(_ textField: UITextField) {
    print("\n================[textFieldDidBeginEditing]================\n")
    if let textCount = textField.text?.isEmpty {
      textField.backgroundColor = .white
    }
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("\n================[textFieldShouldEndEditing]================\n")
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("\n================[textField(_:shouldChangeCharactersIn:replacementString:)]================\n")
    print(textField.text)
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    print("\n================[textFieldDidEndEditing(_:,reason:)]================\n")
    textField.backgroundColor = .lightGray
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  } // called when 'return' key pressed. return NO to ignore.
}
