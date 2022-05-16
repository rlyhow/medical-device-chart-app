//
//  String+Extensions.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 16.05.22.
//

import Foundation

extension String {
    
    func getFormattedDate(formatFrom: String ,formatTo: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatFrom
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        dateFormatter.dateFormat = formatTo
        
        return dateFormatter.string(from: date)
    }
}
