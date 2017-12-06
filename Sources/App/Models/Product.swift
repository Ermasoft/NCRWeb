//
//  Product.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

final class Product: Model {
    let storage = Storage()
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(row: Row) throws {
        name = try row.get("name")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        return row
    }
}

extension Product: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { products in
            products.id()
            products.string("name")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Product: Timestampable { }
