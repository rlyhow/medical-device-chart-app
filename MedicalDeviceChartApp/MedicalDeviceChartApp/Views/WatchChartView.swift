//
//  WatchChartView.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import SwiftUI
import Charts

struct WatchChartView: View {
    
    private let watchChartVM = WatchChartViewVM(jsonParserService: JsonParser())
    
    var body: some View {
        
        watchChartVM.loadMedicineDeviceModel()
        watchChartVM.getDataFrom(base64String: watchChartVM.medicineDeviceObject?.coverObj.filecontent)
        watchChartVM.getArrayOfDoubles()
        
        return TransactionChartView(entries: watchChartVM.getDataEntries())
    }
}

struct WatchChartView_Previews: PreviewProvider {
    static var previews: some View {
        WatchChartView()
    }
}
