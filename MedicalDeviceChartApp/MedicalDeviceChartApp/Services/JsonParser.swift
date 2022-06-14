//
//  JsonParser.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 15.05.22.
//

import Foundation

protocol JsonParserProtocol {
    func loadJson(filename fileName: String) -> MedicineDevice?
}

class JsonParser: JsonParserProtocol {
    
    func loadJson(filename fileName: String) -> MedicineDevice? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MedicineDevice.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}
