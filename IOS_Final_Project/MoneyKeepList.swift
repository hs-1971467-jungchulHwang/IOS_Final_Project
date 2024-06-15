//
//  MoneyKeepList.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//

import Foundation
import UIKit
class MoneyKeepList {
  var storage: [MoneyKeep]
  init() {
   self.storage = [MoneyKeep]()
  }
  public var count: Int{
   return storage.count
  }
  
  public func addNew(image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool) {
    self.storage.append(MoneyKeep(image: image, type: type, memo: memo, price: price, date: date, isExpenditure: isExpenditure))
  }
  public func delete(indexRow : Int) {
        self.storage.remove(at: indexRow)
  }
  public func itemAt(index: Int) -> MoneyKeep {
    return storage[index]
  }
    public func edit(image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool, index: Int){
        storage[index].image = image
        storage[index].type = type
        storage[index].memo = memo
        storage[index].price = price
        storage[index].date = date
        storage[index].isExpenditure = isExpenditure
    }
}
