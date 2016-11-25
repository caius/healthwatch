//
//  WeightEntryController.swift
//  Healthwatch
//
//  Created by Caius Durling on 18/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class EntryController: WKInterfaceController {
  @IBOutlet var picker: WKInterfacePicker!

  var pickerValues: [HWValue] = []
  var chosenValue: HWValue!

  let spread = 120
  let increment = Double(0.1)

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    self.setTitle("cancel")

    guard context != nil else {
      fatalError("No context provided to ValueInputInterfaceController")
    }

    let initialWeight = context as! HWValue
    self.chosenValue = initialWeight

    let offset = (Double(spread) * Double(increment))/2.0
    print(offset)
    let base = initialWeight.value - offset
    for multiplier in 0...spread {
      let value = base + (increment * Double(multiplier))
      let pickerValue = HWValue(value: value, unit: initialWeight.unit)
      pickerValues.append(pickerValue)
    }

    let items = pickerValues.map { (value) -> WKPickerItem in
      return value.pickerItem()
    }

    picker.setItems(items)
    let selectedIndex = items.index { (item) -> Bool in
      item.title == initialWeight.title
    }
    picker.setSelectedItemIndex(selectedIndex!)
    picker.focus()
  }

  @IBAction func pickerChanged(_ pickedIndex: Int) {
    self.chosenValue = pickerValues[pickedIndex]
    print("Chosen value: \(chosenValue.title)")
  }

  @IBAction func saveTapped() {
    print("Saving!")
    print("Chosen value is \(chosenValue.title)")
    pushController(withName: "ConfirmController", context: ["value": chosenValue])
  }

  @IBAction func cancelTapped() {
    print("Cancelling - doing nowt")
    popToRootController()
  }

}
