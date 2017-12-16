//
//  ClientController.swift
//  vaporWebAuth
//
//  Created by SH on 07/12/2017.
//

import Vapor

final class ClientController {
    
    let view: ViewRenderer
    
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    // MARK: -  GET [index] /clients -
    func index(_ req: Request) throws -> ResponseRepresentable {
        let clients = try Client.all()
        let parameters = try Node(node: [
            "clients": clients
            ])
        for client in clients {
            if let id = client.id?.string {
                print(id)
            }
        }
        
        return try view.make("clients", parameters)
    }
    
    
    // MARK: - GET [show] /clients/:id -
    func show(_ req: Request, _ client: Client) throws -> ResponseRepresentable {
        return client
    }
    
    // MARK: - POST [store] /clients -
    func store(_ req: Request) throws -> ResponseRepresentable {
        guard
            let name = req.data["name"]?.string,
            let mobile = req.data["mobile"]?.int,
            let age = req.data["age"]?.int,
            let gender = req.data["gender"]?.string,
            let nationality =  req.data["nationality"]?.string,
            let hospital =  req.data["hospital"]?.string
            else {
                throw Abort.badRequest
        }
        
        let client = Client(name: name, mobile: mobile, age: age, gender: .male, nationality: nationality, hospital: hospital)
        try client.save()
        print(client)
        return Response(redirect: "/clients")
    }
    
    // MARK: - PATCH [update] /clients/:id -
    func update(_ req: Request, _ client: Client) throws -> ResponseRepresentable {
        guard
            let name = req.data["name"]?.string,
            let gender = req.data["gender"]?.string,
            let age = req.data["age"]?.int,
            let daiperBrand = req.data["daiperBrand"]?.string,
            let daiperSize = req.data["daiperSize"]?.string
            else {
                throw Abort.badRequest
        }
        
        let baby = Baby(name: name, gender: Gender(rawValue: gender)!, age: age, daiperBrand: daiperBrand, daiperSize: daiperSize)
        try baby.save()
        return try client.makeJSON()
    }
    
    // MARK: - GET [create] /clients/create
    func create(_ req: Request) throws -> ResponseRepresentable {
        // TODO: For Future use
        return try view.make("client.html")
    }
    
}

extension ClientController: ResourceRepresentable {
    func makeResource() -> Resource<Client> {
        return Resource(
            index: index,
            create: create,
            store: store,
            show: show,
            update: update
        )
    }
}
