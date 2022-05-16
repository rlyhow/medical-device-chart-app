//
//  TransactionChartView.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import SwiftUI
import Charts

struct TransactionChartView: UIViewRepresentable  {
    var entries: [ChartDataEntry]
    
    func makeUIView(context: Context) -> LineChartView {
        return LineChartView()
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        let lineDataSet = LineChartDataSet(entries: entries)
        lineDataSet.label = ""
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.lineWidth = 3
        lineDataSet.setColor(.systemGreen)
        
        let lineData = LineChartData(dataSet: lineDataSet)
        lineData.setDrawValues(false)
        uiView.data = lineData
        
        setUpInteractionWithChart(lineChartView: uiView)
        setUpAxis(lineChartView: uiView)
    }
    
    func setUpInteractionWithChart(lineChartView: LineChartView) {
        lineChartView.dragEnabled = true
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.pinchZoomEnabled = true
    }
    
    func setUpAxis(lineChartView: LineChartView) {
        lineChartView.rightAxis.enabled = false
        
        lineChartView.xAxis.drawLabelsEnabled = false
        lineChartView.xAxis.gridLineWidth = 0.5
        lineChartView.xAxis.setLabelCount(24, force: true)
        
        lineChartView.leftAxis.gridLineWidth = 0.5
        lineChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 14)
        lineChartView.leftAxis.valueFormatter = YAxisValueFormatter()
        lineChartView.leftAxis.axisMinimum = -2
        lineChartView.leftAxis.axisMaximum = 3
        lineChartView.leftAxis.granularity = 1
        
        lineChartView.setVisibleXRangeMaximum(4)
        lineChartView.extraTopOffset = 20
        //lineChartView.extraBottomOffset = 30
    }
}

class YAxisValueFormatter: AxisValueFormatter {
    
    let unitsOfMeasure: String = "mV"
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(value) \(unitsOfMeasure)"
    }
}
