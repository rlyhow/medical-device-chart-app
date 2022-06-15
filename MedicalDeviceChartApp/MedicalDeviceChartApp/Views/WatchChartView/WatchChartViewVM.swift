//
//  TransactionChartViewVM.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import Foundation
import Charts

class WatchChartViewVM: ObservableObject {
     
    var arrayOfDoubles = [Double]()
    var medicineDeviceObject: MedicineDevice?
    
    private let jsonParserService: JsonParserProtocol
    
    init(jsonParserService: JsonParserProtocol) {
        self.jsonParserService = jsonParserService
    }
    
    func loadChartValues(from fileName: String?) {
        if let medicineModel = loadMedicineDeviceModel(from: fileName) {
            if let receivedData = getDataFrom(base64String: medicineModel.coverObj.filecontent) {
                getArrayOfDoubles(receivedData: receivedData)
            }
        }
    }
    
    func loadMedicineDeviceModel(from fileName: String?) -> MedicineDevice? {
        guard let name = fileName else { return nil }
        medicineDeviceObject = jsonParserService.loadJson(filename: name)
        return medicineDeviceObject
    }
    
    func getDataFrom(base64String stringFromFile: String?) -> Data? {
        guard let base64String = stringFromFile else {
            print("ERROR: CAN'T GET STRING FROM MODEL")
            return nil
        }
        
        return Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)
    }
    
    func getArrayOfDoubles(receivedData: Data) {
        
        let multiDimensionalArray = [UInt8](receivedData).chunked(into: MemoryLayout<Double>.stride)
        arrayOfDoubles = []
        
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
    
    func getFormattedDataForChar(formatFrom: String, formatTo: String) -> String {
        guard let date = medicineDeviceObject?.coverObj.fName.getFormattedDate(formatFrom: formatFrom, formatTo: formatTo) else {
            return ""
        }
        
        return date
    }
}
