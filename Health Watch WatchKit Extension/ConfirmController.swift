//
//  ConfirmController.swift
//  Health Watch
//
//  Created by Caius Durling on 23/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class ConfirmController: WKInterfaceController {

  @IBOutlet var label: WKInterfaceLabel!
  var chosenValue: EntryPickerValue!
  
  @IBAction func confirmTapped() {
    print("Action confirmed - We should save \(chosenValue)")
  }

  @IBAction func cancelTapped() {
    print("Cancelled on confirmation screen")
    popToRootController()
  }
}
