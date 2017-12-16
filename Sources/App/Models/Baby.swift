//
//  Baby.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

// MARK: - Class: Baby -
final class Baby: Model, NodeConvertible {
    
    let storage = Storage()
    var name: String
    var gender: Gender.RawValue
    var age: Int
    var daiperBrand: String
    var daiperSize: String
    
    // MARK: - Initializer -
    init(name: String, gender: Gender, age: Int, daiperBrand: String, daiperSize: String) {
        self.name = name
        self.gender = gender.rawValue
        self.age = age
        self.daiperBrand = daiperBrand
        self.daiperSize = daiperSize
    }
    
    // MARK: - NodeConvertible -
    init(node: Node) throws {
        name = try node.get("name")
        gender = try node.get("gender")
        age = try node.get("age")
        daiperBrand = try node.get("daiperBrand")
        daiperSize = try node.get("daiperSize")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        try node.set("gender", gender)
        try node.set("age", age)
        try node.set("daiperBrand", daiperBrand)
        try node.set("daiperSize", daiperSize)
        return node
        
    }
    
    // MARK: - DB: Parse & Serialize -
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

// MARK: - JSONConvertible -
extension Baby: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name"),
            gender: json.get("gender"),
            age: json.get("age"),
            daiperBrand: json.get("daiperBrand"),
            daiperSize: json.get("daiperSize")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", name)
        try json.set("gender", gender)
        try json.set("age", age)
        try json.set("daiperBrand", daiperBrand)
        try json.set("daiperSize", daiperSize)
        return json
    }
}

// MARK: - Database Preparation -
extension Baby: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { babies in
            babies.id()
            babies.foreignId(for: Client.self)
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

// MARK: - Timestampable -
extension Baby: Timestampable { }

// MARK: - ResponseRepresentable -
extension Baby: ResponseRepresentable { }

