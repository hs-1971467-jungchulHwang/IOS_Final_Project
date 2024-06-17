//
//  AddViewController.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//

import Foundation
import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var labelPrice: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelMemo: UITextField!
  
    var selectRow = 0
    var isExtended = true
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buyType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buyType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectRow = row
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    @IBAction func segmentChanged(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
                isExtended = true
            }
        if (sender as AnyObject).selectedSegmentIndex == 1 {
                isExtended = false
            }
    }
    @IBAction func btnAdd(_ sender: Any) {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: today)
        if(isExtended){
            expendList.addNew(image: buyImage[selectRow],  type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended)
        }else{
            incomeList.addNew(image: buyImage[selectRow],  type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
