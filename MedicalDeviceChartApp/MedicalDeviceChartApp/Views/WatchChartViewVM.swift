//
//  TransactionChartViewVM.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import Foundation
import Charts

class WatchChartViewVM {
    
    var receivedData: Data = Data()
    var fileName: String? = "deviceInfo"
    
    var arrayOfDoubles = [Double]()
    var entries: [ChartDataEntry] = []
    
    var medicineDeviceObject: MedicineDevice?
    private let jsonParserService: JsonParser
    
    init(jsonParserService: JsonParser) {
        self.jsonParserService = jsonParserService
    }
    
    func loadMedicineDeviceModel() {
        guard let name = fileName else {
            print("ERROR: CAN'T FIND FILE")
            return
        }
        medicineDeviceObject = jsonParserService.loadJson(filename: name)
        print("SUCCESS LOAD FILE")
    }
    
    func getDataFrom(base64String stringFromFile: String?) {
        guard let base64String = stringFromFile else {
            print("ERROR: CAN'T GET STRING FROM MODEL")
            return
        }
        
        guard let dataFromEncodedString = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) else {
            print("ERROR: CAN'T GET DATA FROM base64String")
            return
        }
        
        receivedData = dataFromEncodedString
    }
    
    func getArrayOfDoubles() {
        
        let multiDimensionalArray = [UInt8](receivedData).chunked(into: MemoryLayout<Double>.stride)
        
        multiDimensionalArray.forEach({
            arrayOfDoubles.append(binaryToType($0.reversed(), Double.self))
        })
        
    }
    
    func binaryToType <T> (_ value: [UInt8], _: T.Type) -> T
    {
        return value.withUnsafeBufferPointer {
            $0.baseAddress!
              .withMemoryRebound(to: T.self, capacity: 1) {
                $0.pointee
            }
        }
    }
    
    func getDataEntries() -> [ChartDataEntry] {
        var dataArray: [ChartDataEntry] = []

        arrayOfDoubles.enumerated().forEach { (index, item) in
            dataArray.append(ChartDataEntry(x: 0.00195 * Double(index), y: item))
        }
            
        return dataArray
    }
    
}
