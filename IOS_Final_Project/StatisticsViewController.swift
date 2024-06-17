//
//  StatisticsViewController.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//
import Foundation
import UIKit
import Charts

class statisticsViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    var buyPrice: [Double]!
    let pieType = ["지출", "수입"]
    var piePrice: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        buyPrice = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        piePrice = [0.0, 0.0]
        
        for (_, value) in expendList.storage.enumerated(){
            buyPrice[value.type] += Double(value.price)!
            piePrice[0] += Double(value.price)!
        }
        for (_, value) in incomeList.storage.enumerated(){
            buyPrice[value.type] += Double(value.price)!
            piePrice[1] += Double(value.price)!
        }
                barChartView.noDataText = "데이터가 없습니다."
                barChartView.noDataFont = .systemFont(ofSize: 20)
                barChartView.noDataTextColor = .lightGray
                
                setChart(dataPoints: buyType, values: buyPrice)
                setPieChart(dataPoints: pieType, values: piePrice)
    }
    func setChart(dataPoints: [String], values: [Double]) {
          
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "금액")

        chartDataSet.colors = [.systemGreen]

        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        chartDataSet.highlightEnabled = false
        
        barChartView.doubleTapToZoomEnabled = false


        barChartView.xAxis.labelPosition = .bottom
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: buyType)

        
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        
        barChartView.rightAxis.enabled = false
        
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)

        }
    
    func setPieChart(dataPoints: [String], values: [Double]){
        
          var dataEntries: [ChartDataEntry] = []
          for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
          
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
          pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
          
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
          let format = NumberFormatter()
          format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
        
          pieChartView.data = pieChartData
    }
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        
        let color = UIColor(red: CGFloat(255/255), green: CGFloat(0), blue: CGFloat(0), alpha: 1)
        colors.append(color)
        let color2 = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(255/255), alpha: 1)
        colors.append(color2)
      }
      return colors
    }
}
