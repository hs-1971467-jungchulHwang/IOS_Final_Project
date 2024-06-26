//
//  DetailViewController.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelMemo: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelPrice: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    var selectRow = 0
    var list = MoneyKeep(image: buyImage[0],  type: 0 , memo: "옷 쇼핑", price: "5000", date: "2024.06.25", isExpenditure: true)
    var indexOfList = 0
    var isExtended = true
    var initExtended = true
    
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
        labelMemo.text = list.memo
        labelPrice.text = list.price
        pickerView.selectRow((list.type), inComponent:0, animated:true)
        if(list.isExpenditure == false){
           segmented.selectedSegmentIndex = 1
           isExtended = false
           initExtended = false
        }
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
                isExtended = true
            }
        if (sender as AnyObject).selectedSegmentIndex == 1 {
                isExtended = false
            }
    }
    @IBAction func btnEdit(_ sender: Any) {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: today)
        if(isExtended == true && initExtended == true){
            expendList.edit(image: buyImage[selectRow], type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended, index: indexOfList)
        }else if(isExtended == false && initExtended == false){
            incomeList.edit(image: buyImage[selectRow], type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended, index: indexOfList)
        }else if(isExtended == true && initExtended == false){
            incomeList.delete(indexRow: indexOfList)
            expendList.addNew(image: buyImage[selectRow], type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended)
        }else{
            expendList.delete(indexRow: indexOfList)
            incomeList.addNew(image: buyImage[selectRow], type: selectRow, memo: labelMemo.text!, price: labelPrice.text!, date: dateString, isExpenditure: isExtended)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
