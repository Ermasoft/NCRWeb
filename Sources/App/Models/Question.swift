//
//  Question.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

// MARK: - Class: Question -
final class Question: Model, NodeConvertible {
    
    let storage = Storage()
    
    var Q1: String
    var Q2: String
    var Q3: String
    var Q4: String
    var Q5: String
    var Q6: String
    var Q7: String
    var Q8: String
    var Q9: String
    var Q10: String
    
    // MARK: - Initializer -
    init(Q1: String,Q2: String,Q3: String,Q4: String,Q5: String,Q6: String,Q7: String,Q8: String,Q9: String,Q10: String) {
        self.Q1 = Q1
        self.Q2 = Q2
        self.Q3 = Q3
        self.Q4 = Q4
        self.Q5 = Q5
        self.Q6 = Q6
        self.Q7 = Q7
        self.Q8 = Q8
        self.Q9 = Q9
        self.Q10 = Q10
    }
    
    // MARK: - NodeConvertible -
    init(node: Node) throws {
        Q1 = try node.get("Q1")
        Q2 = try node.get("Q2")
        Q3 = try node.get("Q3")
        Q4 = try node.get("Q4")
        Q5 = try node.get("Q5")
        Q6 = try node.get("Q6")
        Q7 = try node.get("Q7")
        Q8 = try node.get("Q8")
        Q9 = try node.get("Q9")
        Q10 = try node.get("Q10")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("Q1",Q1)
        try node.set("Q2",Q2)
        try node.set("Q3",Q3)
        try node.set("Q4",Q4)
        try node.set("Q5",Q5)
        try node.set("Q6",Q6)
        try node.set("Q7",Q7)
        try node.set("Q8",Q8)
        try node.set("Q9",Q9)
        try node.set("Q10",Q10)
        return node
    }
    
    // MARK: - DB: Parse & Serialize -
    init(row: Row) throws {
        Q1 = try row.get("Q1")
        Q2 = try row.get("Q2")
        Q3 = try row.get("Q3")
        Q4 = try row.get("Q4")
        Q5 = try row.get("Q5")
        Q6 = try row.get("Q6")
        Q7 = try row.get("Q7")
        Q8 = try row.get("Q8")
        Q9 = try row.get("Q9")
        Q10 = try row.get("Q10")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("Q1",Q1)
        try row.set("Q2",Q2)
        try row.set("Q3",Q3)
        try row.set("Q4",Q4)
        try row.set("Q5",Q5)
        try row.set("Q6",Q6)
        try row.set("Q7",Q7)
        try row.set("Q8",Q8)
        try row.set("Q9",Q9)
        try row.set("Q10",Q10)
        return row
    }
}

// MARK: - JSONConvertible -
extension Question: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            Q1: json.get("Q1"),
            Q2: json.get("Q2"),
            Q3: json.get("Q3"),
            Q4: json.get("Q4"),
            Q5: json.get("Q5"),
            Q6: json.get("Q6"),
            Q7: json.get("Q7"),
            Q8: json.get("Q8"),
            Q9: json.get("Q9"),
            Q10: json.get("Q10")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("Q1",Q1)
        try json.set("Q2",Q2)
        try json.set("Q3",Q3)
        try json.set("Q4",Q4)
        try json.set("Q5",Q5)
        try json.set("Q6",Q6)
        try json.set("Q7",Q7)
        try json.set("Q8",Q8)
        try json.set("Q9",Q9)
        try json.set("Q10",Q10)
        return json
    }
}

// MARK: - Database Preparation -
extension Question: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { questions in
            questions.id()
            questions.string("Q1")
            questions.string("Q2")
            questions.string("Q3")
            questions.string("Q4")
            questions.string("Q5")
            questions.string("Q6")
            questions.string("Q7")
            questions.string("Q8")
            questions.string("Q9")
            questions.string("Q10")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// MARK: - Timestampable -
extension Question: Timestampable { }

// MARK: - ResponseRepresentable -
extension Question: ResponseRepresentable { }
