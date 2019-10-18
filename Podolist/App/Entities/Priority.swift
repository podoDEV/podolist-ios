//
//  Priority.swift
//  Podolist
//
//  Created by hb1love on 2019/10/18.
//  Copyright © 2019 podo. All rights reserved.
//

enum Priority: String, Codable {
    case urgent
    case high
    case medium
    case low
    case none
}

extension Priority {
    func toString() -> String {
        switch self {
        case .urgent:
            return InterfaceString.Priority.Urgent
        case .high:
            return InterfaceString.Priority.High
        case .medium:
            return InterfaceString.Priority.Medium
        case .low:
            return InterfaceString.Priority.Low
        case .none:
            return InterfaceString.Priority.None
        }
    }

    func backgroundColor() -> UIColor {
        switch self {
        case .urgent:
            return .priorityColor1
        case .high:
            return .priorityColor2
        case .medium:
            return .priorityColor3
        case .low:
            return .priorityColor4
        case .none:
            return .priorityColor5
        }
    }
}
