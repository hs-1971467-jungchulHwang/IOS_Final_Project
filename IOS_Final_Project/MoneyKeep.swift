//
//  MoneyKeep.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//

import Foundation
import UIKit
struct MoneyKeep{
    var image : UIImage
    var type : Int
    var memo : String
    var price : String
    var date : String
    var isExpenditure : Bool
    
    init( image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool){
        self.image = image
        self.type = type
        self.memo = memo
        self.price = price
        self.date = date
        self.isExpenditure = isExpenditure
    }
}
