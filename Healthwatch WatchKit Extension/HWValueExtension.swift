//
//  HWValueExtension.swift
//  Healthwatch
//
//  Created by Caius Durling on 24/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import WatchKit

extension HWValue {
  func pickerItem() -> WKPickerItem {
    let item = WKPickerItem()
    item.title = self.title
    return item
  }
}
