//
//  InterfaceController.swift
//  Healthwatch WatchKit Extension
//
//  Created by Caius Durling on 09/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class RootMenuItem {
  let title: String
  let initialValue: () -> HWValue

  init(title: String, initialValue: @escaping () -> HWValue) {
    self.title = title
    self.initialValue = initialValue
  }
}

class RootController: WKInterfaceController {

  @IBOutlet var table: WKInterfaceTable!

  let buttons = ["Weight", "Fat %"]

  let menuChoices: [RootMenuItem] = [
    RootMenuItem(title: "Body Fat %") { () -> HWValue in
      return HWValue(value: 118.1, unit: "kg")
    },
    RootMenuItem(title: "Weight") { () -> HWValue in
      return HWValue(value: 23.3, unit: "%")
    }

  ]

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    // Configure interface objects here.

    table.setNumberOfRows(buttons.count, withRowType: "RootRowController")
    // TODO: Figure out & fix for loop
    // Fails with "Expression type '[RootMenuItem]' is ambiguous without more context" ?!
    // for (index, menuItem) in menuChoices {
    for index in 0..<menuChoices.count {
      let menuItem = menuChoices[index]
      let row = table.rowController(at: index) as! RootRowController
      row.label.setText(menuItem.title)
    }
  }

  override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {


    return [HWValue(value: 118.1, unit: "kg")]
  }

  /*
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    switch rowIndex {
    case 0: // Weight
      print("Weight!")
//      pushController(withName: "EntryController", context: HWValue(value: 118.1, unit: "kg"))

    case 1: // Fat %
      print("Fat %!")
//      pushController(withName: "EntryController", context: HWValue(value: 23.5, unit: "%"))

    default:
      fatalError("Unknown menu item tapped")
    }
  }
*/
}
