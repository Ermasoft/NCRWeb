//
//  Answer.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

final class Answer: Model {
    
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

extension Answer: Timestampable { }
