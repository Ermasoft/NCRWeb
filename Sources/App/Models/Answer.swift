//
//  Answer.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

// MARK: - Class: Answer -
final class Answer: Model, NodeConvertible {
    
    let storage = Storage()
    var A1: String
    var A2: String
    var A3: String
    var A4: String
    var A5: String
    var A6: String
    var A7: String
    var A8: String
    var A9: String
    var A10: String
    
    // MARK: - Initializer -
    init(A1: String, A2: String, A3: String, A4: String, A5: String, A6: String, A7: String, A8: String, A9: String, A10: String) {
        self.A1 = A1
        self.A2 = A2
        self.A3 = A3
        self.A4 = A4
        self.A5 = A5
        self.A6 = A6
        self.A7 = A7
        self.A8 = A8
        self.A9 = A9
        self.A10 = A10
    }
    
    // MARK: - NodeConvertible -
    init(node: Node) throws {
        A1 = try node.get("A1")
        A2 = try node.get("A2")
        A3 = try node.get("A3")
        A4 = try node.get("A4")
        A5 = try node.get("A5")
        A6 = try node.get("A6")
        A7 = try node.get("A7")
        A8 = try node.get("A8")
        A9 = try node.get("A9")
        A10 = try node.get("A10")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("A1", A1)
        try node.set("A2", A2)
        try node.set("A3", A3)
        try node.set("A4", A4)
        try node.set("A5", A5)
        try node.set("A6", A6)
        try node.set("A7", A7)
        try node.set("A8", A8)
        try node.set("A9", A9)
        try node.set("A10", A10)
        return node
    }
    
    // MARK: - DB: Parse & Serialize -
    init(row: Row) throws {
        A1 = try row.get("A1")
        A2 = try row.get("A2")
        A3 = try row.get("A3")
        A4 = try row.get("A4")
        A5 = try row.get("A5")
        A6 = try row.get("A6")
        A7 = try row.get("A7")
        A8 = try row.get("A8")
        A9 = try row.get("A9")
        A10 = try row.get("A10")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("A1", A1)
        try row.set("A2", A2)
        try row.set("A3", A3)
        try row.set("A4", A4)
        try row.set("A5", A5)
        try row.set("A6", A6)
        try row.set("A7", A7)
        try row.set("A8", A8)
        try row.set("A9", A9)
        try row.set("A10", A10)
        return row
    }
}

// MARK: - JSONConvertible -
extension Answer: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            A1: json.get("A1"),
            A2: json.get("A2"),
            A3: json.get("A3"),
            A4: json.get("A4"),
            A5: json.get("A5"),
            A6: json.get("A6"),
            A7: json.get("A7"),
            A8: json.get("A8"),
            A9: json.get("A9"),
            A10: json.get("A10")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("A1", A1)
        try json.set("A2", A2)
        try json.set("A3", A3)
        try json.set("A4", A4)
        try json.set("A5", A5)
        try json.set("A6", A6)
        try json.set("A7", A7)
        try json.set("A8", A8)
        try json.set("A9", A9)
        try json.set("A10", A10)
        return json
    }
}

// MARK: - Database Preparation -
extension Answer: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { answers in
            answers.id()
            answers.string("A1")
            answers.string("A2")
            answers.string("A3")
            answers.string("A4")
            answers.string("A5")
            answers.string("A6")
            answers.string("A7")
            answers.string("A8")
            answers.string("A9")
            answers.string("A10")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// MARK: - Timestampable -
extension Answer: Timestampable { }

// MARK: - ResponseRepresentable -
extension Answer: ResponseRepresentable { }
