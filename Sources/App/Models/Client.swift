//
//  Client.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

enum Gender {
    case male, female
}

final class Client: Model {
    
    let storage = Storage()
    
    var name: String
    var mobile: Int
    var age: Int
    var gender: Gender
    var nationality: String
    var hospital: String
    
    init(name: String, mobile: Int, age: Int, gender: Gender, nationality: String, hospital: String) {
        self.name = name
        self.mobile = mobile
        self.age = age
        self.gender = gender
        self.nationality = nationality
        self.hospital = hospital
    }
    
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

extension Client: Timestampable { }

