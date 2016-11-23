//
//  ConfirmController.swift
//  Health Watch
//
//  Created by Caius Durling on 23/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class ConfirmController: WKInterfaceController {

  @IBOutlet var valueLabel: WKInterfaceLabel!

  var chosenValue: EntryPickerValue!

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    self.chosenValue = (context as! [String: Any])["value"] as! EntryPickerValue

    guard chosenValue != nil else {
      fatalError("No value passed to ConfirmController")
    }

    self.valueLabel.setText(chosenValue.title)
  }

  @IBAction func confirmTapped() {
    print("Action confirmed - We should save \(chosenValue.title)")
  }

  @IBAction func cancelTapped() {
    print("Cancelled on confirmation screen")
    popToRootController()
  }
}
