//
//  Question.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

final class Question: Model {
    
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

extension Question: Timestampable { }
