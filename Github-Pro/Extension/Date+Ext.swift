//
//  Date+Ext.swift
//  Github-Pro
//
//  Created by Developer on 23/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
        
    }
    
}
