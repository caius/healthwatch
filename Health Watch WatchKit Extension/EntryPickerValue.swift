//
//  EntryPickerValue.swift
//  Health Watch
//
//  Created by Caius Durling on 23/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

class EntryPickerValue {
  let title: String
  let value: Double

  init(value: Double, unit: String) {
    self.value = value
    self.title = "\(value) \(unit)"
  }

  func pickerItem() -> WKPickerItem {
    let item = WKPickerItem()
    item.title = self.title
    return item
  }

}
