//
//  InterfaceController.swift
//  Healthwatch WatchKit Extension
//
//  Created by Caius Durling on 09/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit
import Foundation


class RootController: WKInterfaceController {

  @IBOutlet var table: WKInterfaceTable!

  let buttons = ["Weight", "Fat %"]

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    // Configure interface objects here.

    table.setNumberOfRows(buttons.count, withRowType: "RootRowController")
    for i in 0..<buttons.count {
      let row = table.rowController(at: i) as! RootRowController
      row.label.setText(buttons[i])
    }
  }

  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    switch rowIndex {
    case 0: // Weight
      print("Weight!")
      pushController(withName: "EntryController", context: HWValue(value: 118.1, unit: "kg"))

    case 1: // Fat %
      print("Fat %!")
//      pushController(withName: "EntryController", context: HWValue(value: 23.5, unit: "%"))

    default:
      fatalError("Unknown menu item tapped")
    }
  }

}
