//
//  Hospital.swift
//  App
//
//  Created by SH on 19/12/2017.
//

import Vapor

final class Hospital: NodeConvertible {
    
    var name: String
    var count: Int = 1
    var percentage: Double = 0
    
    init(name: String) {
        self.name = name
    }
    
    init(node: Node) throws {
        name = try node.get("name")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        try node.set("count", count)
        try node.set("percentage", percentage)
        return node
    }
    
    func calculatePercentate(In totalCount: Int) {
        percentage = round((Double((Double(count) * 100) / Double(totalCount))) * 100) / 100
    }
    
    func incrementCount() {
        count += 1
    }
    
    
}

// MARK: - JSONConvertible -
extension Hospital: JSONConvertible {
    
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", name)
        try json.set("count", count)
        try json.set("percentage", percentage)
        return json
    }
}

// MARK: - Equitable -
extension Hospital: Equatable {
    static func ==(lhs: Hospital, rhs: Hospital) -> Bool {
        return lhs.name == rhs.name
    }
}
