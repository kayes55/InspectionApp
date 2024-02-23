//
//  InspectionDataModel.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import Foundation

class InspectionDataModel: Identifiable {
    var id = UUID()
    let title: String
    let subtitle: String
    let date: String
    
    init(id: UUID = UUID(), title: String, subtitle: String, date: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }
}

class InspectionDataFactory {
    static let shared = InspectionDataFactory()
    
    private init() {}
    
    func inspecedData() -> [InspectionDataModel] {
        var data = [InspectionDataModel]()
        
        data.append(InspectionDataModel(title: "Weekly Inspection", subtitle: "Holiday Inn Express Franklin", date: "16, Dec"))
        data.append(InspectionDataModel(title: "Above-Property Assesment", subtitle: "Holiday Inn Express Franklin", date: "18, Dec"))
        data.append(InspectionDataModel(title: "Audit Shift Checklist", subtitle: "Holiday Inn Express Franklin", date: "18, Dec"))
        data.append(InspectionDataModel(title: "Do Not Disturb - Daily Tracking List", subtitle: "Holiday Inn Express Franklin", date: "19, Dec"))
        data.append(InspectionDataModel(title: "Do Not Disturb - Weekly Tracking List", subtitle: "Holiday Inn Express Franklin", date: "20, Dec"))
        data.append(InspectionDataModel(title: "Annual Inspection", subtitle: "Holiday Inn Express Franklin", date: "21, Dec"))
        data.append(InspectionDataModel(title: "Biennial Inspection", subtitle: "Holiday Inn Express Franklin", date: "22, Dec"))
        
        return data
    }
}
