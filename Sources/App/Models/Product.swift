//
//  Product.swift
//  vaporWebAuth
//
//  Created by SH on 05/12/2017.
//

import FluentProvider

// MARK: - Class: Product -
final class Product: Model, NodeConvertible {
    
    let storage = Storage()
    var name: String
    
    // MARK: - Initializer -
    init(name: String) {
        self.name = name
    }
    
    // MARK: - NodeConvertible -
    init(node: Node) throws {
        name = try node.get("name")
    }
    
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        return node
        
    }
    
    // MARK: - DB: Parse & Serialize -
    init(row: Row) throws {
        name = try row.get("name")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        return row
    }
}

// MARK: - JSONConvertible -
extension Product: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", name)
        return json
    }
}

// MARK: - Database Preparation -
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

// MARK: - Timestampable -
extension Product: Timestampable { }

// MARK: - ResponseRepresentable -
extension Product: ResponseRepresentable { }
