//
//  Podo.swift
//  Podolist
//
//  Copyright © 2018년 podo. All rights reserved.
//

import SwiftyJSON

class Podo: JSONable {
    var id: Int?
    var title: String?
    var isCompleted: Bool?
    var startedAt: Int?
    var endedAt: Int?
    var updatedAt: Int?
    var priority: Priority?

    init(id: Int?, title: String?, isCompleted: Bool?, startedAt: Int?, endedAt: Int?, updatedAt: Int?, priority: Priority?) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.updatedAt = updatedAt
        self.priority = priority
    }

    required init(json: JSON) {
        id = json["itemId"].intValue
        title = json["description"].stringValue
        isCompleted = json["isCompleted"].boolValue
        startedAt = json["startedAt"].intValue
        endedAt = json["endedAt"].intValue
        updatedAt = json["updatedAt"].intValue
        priority = Priority(rawValue: json["priority"].stringValue)
    }

    convenience init(responsePodo: ResponsePodo) {
        self.init(id: responsePodo.id,
                  title: responsePodo.title,
                  isCompleted: responsePodo.isCompleted,
                  startedAt: responsePodo.startedAt,
                  endedAt: responsePodo.endedAt,
                  updatedAt: responsePodo.updatedAt,
                  priority: responsePodo.priority)
    }
}
