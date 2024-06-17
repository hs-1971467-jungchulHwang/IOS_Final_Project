//
//  ViewController.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/14.
//

import UIKit

var expendList = MoneyKeepList()
var incomeList = MoneyKeepList()

let buyType = ["쇼핑","음식","교통","오락","생활","투자", "여행", "월급", "용돈"]
let buyImage = [ #imageLiteral(resourceName: "online-shopping"),#imageLiteral(resourceName: "food"),#imageLiteral(resourceName: "vehicles"),#imageLiteral(resourceName: "game-controller"),#imageLiteral(resourceName: "house"),#imageLiteral(resourceName: "investment"),#imageLiteral(resourceName: "travel-bag"),#imageLiteral(resourceName: "money")]
class ViewController: UIViewController{
    
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmented: UISegmentedControl!
    var filteredData: [String]!
    var data: [String]!
    var searchController: UISearchController!
    var isAll = true
    var isExpended = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        
        
        expendList.addNew(image: buyImage[0],  type: 0 , memo: "옷 쇼핑", price: "50,000", date: "2024.06.25", isExpenditure: true)
        incomeList.addNew(image: buyImage[7],  type: 7 , memo: "5월 월급", price: "2,000,000", date: "2024.06.07", isExpenditure: false)
        incomeList.addNew(image: buyImage[7],  type: 7 , memo: "6월 월급", price: "2,000,000", date: "2024.06.07", isExpenditure: false)
        expendList.addNew(image: buyImage[6],  type: 6 , memo: "제주도 여행", price: "350,000", date: "2024.06.07", isExpenditure: true)
        expendList.addNew(image: buyImage[2],  type: 2 , memo: "5월 교통비", price: "80,000", date: "2024.06.07", isExpenditure: true)
        expendList.addNew(image: buyImage[4],  type: 4 , memo: "핸드폰 요금", price: "100,000", date: "2024.06.01", isExpenditure: true)
        expendList.addNew(image: buyImage[1],  type: 1 , memo: "점심 식사", price: "10,000", date: "2024.06.07", isExpenditure: true)
        expendList.addNew(image: buyImage[5],  type: 5 , memo: "주식 투자", price: "100,000", date: "2024.06.05", isExpenditure: true)
        
        
        tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    @IBAction func segmentChanged(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            isExpended = true
            tableView.reloadData()
        }
        if (sender as AnyObject).selectedSegmentIndex == 1 {
               
            isExpended = false
            tableView.reloadData()
        }
       
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(isExpended){
            return expendList.count
            
        }else{
            return incomeList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as? AccountTableViewCell else{
            return UITableViewCell()
        }
        var acc = MoneyKeep(image: buyImage[0],  type: 0 , memo: "쇼핑", price: "5000", date: "2020.02.25", isExpenditure: true)
        
        if(isExpended){
            acc = expendList.itemAt(index: indexPath.row)
        }else{
            acc = incomeList.itemAt(index: indexPath.row)
        }
       
            cell.uiImage.image = buyImage[acc.type]
            cell.uiType.text = buyType[acc.type]
            cell.uiMemo.text = acc.memo
            cell.uiPrice.text = acc.price + "원"
            cell.uiDate.text = acc.date
            if (acc.isExpenditure) {
                cell.uiPrice.textColor = .red
            } else {
                cell.uiPrice.textColor = .blue
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
        performSegue(withIdentifier: "DetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if let destination = segue.destination as? DetailViewController {
                
                    if(isExpended){
                        destination.list = expendList.itemAt(index: (tableView.indexPathForSelectedRow?.row)!)
                    }else{
                        destination.list = incomeList.itemAt(index: (tableView.indexPathForSelectedRow?.row)!)
                    }
                
                
                destination.indexOfList = (tableView.indexPathForSelectedRow?.row)!
                tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
                
            }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                
                    if(isExpended){
                        expendList.delete(indexRow: indexPath.row)
                    }else{
                        incomeList.delete(indexRow: indexPath.row)
                    }
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    
}
