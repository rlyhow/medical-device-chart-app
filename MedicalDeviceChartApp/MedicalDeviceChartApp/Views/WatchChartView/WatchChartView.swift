//
//  WatchChartView.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import SwiftUI 
 
struct WatchChartView: View {
    
    @StateObject var watchChartVM = WatchChartViewVM(jsonParserService: JsonParser())
    @State private var fileName = "deviceInfo"
    
    var body: some View {
        watchChartVM.loadChartValues(from: fileName)
        
        return VStack {
            HStack (spacing: 20) {
                Text(watchChartVM.medicineDeviceObject?.coverObj.descr ?? "")
                    .padding(10)
                    .font(.title2)

                Text(watchChartVM.getFormattedDataForChar(formatFrom: "yyyy-MM-dd_HH-mm-ss", formatTo: "yyyy-MM-dd HH:mm:ss"))
                    .font(.title2)
                
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 3)
            )
            
            TransactionChartView(entries: watchChartVM.getDataEntries())
        } .padding([.top, .leading, .trailing], 10)
    }
}

struct WatchChartView_Previews: PreviewProvider {
    static var previews: some View {
        WatchChartView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
