//
//  HWValue.swift
//  Healthwatch
//
//  Created by Caius Durling on 23/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

class HWValue {
  let title: String
  let value: Double
  let unit: String

  init(value: Double, unit: String) {
    self.value = value
    self.unit = unit
    self.title = "\(value) \(unit)"
  }

  func description() -> String {
    return "HWValue(\(title))"
  }

}
