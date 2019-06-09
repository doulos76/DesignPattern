//
//  TableViewViewController.swift
//  DelegatePatternExample
//
//  Created by dave76 on 09/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
  
  // MARK:- Property
  let cellId = "cellId"
  let bookList = ["Outlier", "David & Goliat", "Tipping Point"]
 
  @IBOutlet var tableView: UITableView!
  
  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// MARK:- Extension : TableView Data Source
extension TableViewViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = bookList[indexPath.row]
    return cell
  }
}

// MARK:- Extension : TableView Delegate

extension TableViewViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    print(bookList[indexPath.row])
  }
}
