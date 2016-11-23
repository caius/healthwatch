//
//  WeightEntryController.swift
//  Health Watch
//
//  Created by Caius Durling on 18/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class EntryController: WKInterfaceController {
  @IBOutlet var picker: WKInterfacePicker!

  var pickerValues: [EntryPickerValue] = []
  var chosenValue: EntryPickerValue?

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    guard context != nil else {
      fatalError("No context provided to ValueInputInterfaceController")
    }

    let initialWeight = context as! Double
    let unit = "kg"
    let spread = 120
    let increment = Double(0.1)

    for multiplier in 0...spread {
      let value = initialWeight + (increment * Double(multiplier))
      let pickerValue = EntryPickerValue(value: value, unit: unit)
      pickerValues.append(pickerValue)
    }

    let items = pickerValues.map { (value) -> WKPickerItem in
      return value.pickerItem()
    }

    picker.setItems(items)
    picker.focus()
  }

  @IBAction func pickerChanged(_ pickedIndex: Int) {
    self.chosenValue = pickerValues[pickedIndex]
    print("Chosen value: \(chosenValue!.title)")
  }

  @IBAction func saveTapped() {
    exitingWith {
      print("Saving!")
      print("Chosen value is \(chosenValue!.title)")
    }
  }

  @IBAction func cancelTapped() {
    exitingWith {
      print("Cancelling - doing nowt")
    }
  }

  private func exitingWith(completion: () -> Void) {
    picker.resignFocus()
    completion()
    popToRootController()
  }
}
