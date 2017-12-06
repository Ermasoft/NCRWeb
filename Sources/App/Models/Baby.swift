//
//  Baby.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

final class Baby: Model {
    
    let storage = Storage()
    
    var name: String
    var gender: Gender
    var age: Int
    var daiperBrand: String
    var daiperSize: String
    
    init(name: String, gender: Gender, age: Int, daiperBrand: String, daiperSize: String) {
        self.name = name
        self.gender = gender
        self.age = age
        self.daiperBrand = daiperBrand
        self.daiperSize = daiperSize
    }
    
    init(row: Row) throws {
        name = try row.get("name")
        gender = try row.get("gender")
        age = try row.get("age")
        daiperBrand = try row.get("daiperBrand")
        daiperSize = try row.get("daiperSize")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        try row.set("gender", gender)
        try row.set("age", age)
        try row.set("daiperBrand", daiperBrand)
        try row.set("daiperSize", daiperSize)
        return row
        
    }
}

extension Baby: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { babies in
            babies.id()
            babies.string("name")
            babies.string("gender")
            babies.int("age")
            babies.string("daiperBrand")
            babies.string("daiperSize")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Baby: Timestampable { }
