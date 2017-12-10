//
//  Client.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

// MARK: - ENUM: Gender -
enum Gender: String {
    case male = "Male"
    case female = "Female"
}

// MARK: - Class: Client -
final class Client: Model, NodeConvertible {
    
    let storage = Storage()
    var name: String
    var mobile: Int
    var age: Int
    var gender: Gender.RawValue
    var nationality: String
    var hospital: String
    
    // MARK: - Initializer -
    init(name: String, mobile: Int, age: Int, gender: Gender, nationality: String, hospital: String) {
        self.name = name
        self.mobile = mobile
        self.age = age
        self.gender = gender.rawValue
        self.nationality = nationality
        self.hospital = hospital
    }
    
    // MARK: - NodeConvertible -
    init(node: Node) throws {
        name = try node.get("name")
        mobile = try node.get("mobile")
        age = try node.get("age")
        gender = try node.get("gender")
        nationality = try node.get("nationality")
        hospital = try node.get("hospital")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        try node.set("mobile", mobile)
        try node.set("age", age)
        try node.set("gender", gender)
        try node.set("nationality", nationality)
        try node.set("hospital", hospital)
        return node
    }
    
    // MARK: - DB: Parse & Serialize -
    init(row: Row) throws {
        name = try row.get("name")
        mobile = try row.get("mobile")
        age = try row.get("age")
        gender = try row.get("gender")
        nationality = try row.get("nationality")
        hospital = try row.get("hospital")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        try row.set("mobile", mobile)
        try row.set("age", age)
        try row.set("gender", gender)
        try row.set("nationality", nationality)
        try row.set("hospital", hospital)
        return row
    }
    
}

// MARK: - JSONConvertible -
extension Client: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name"),
            mobile: json.get("mobile"),
            age: json.get("age"),
            gender: json.get("gender"),
            nationality: json.get("nationality"),
            hospital: json.get("hospital")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", name)
        try json.set("mobile", mobile)
        try json.set("age", age)
        try json.set("gender", gender)
        try json.set("nationality", nationality)
        try json.set("hospital", hospital)
        return json
    }
}

// MARK: - Database Preparation -
extension Client: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { clients in
            clients.id()
            clients.string("name")
            clients.int("mobile")
            clients.int("age")
            clients.string("gender")
            clients.string("nationality")
            clients.string("hospital")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// MARK: - Timestampable -
extension Client: Timestampable { }

// MARK: - ResponseRepresentable -
extension Client: ResponseRepresentable { }
