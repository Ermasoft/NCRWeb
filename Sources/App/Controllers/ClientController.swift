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
    
    func newClient(_ req: Request) throws -> ResponseRepresentable {
        guard
            let name = req.data["name"]?.string,
            let mobile = req.data["mobile"]?.int,
            let nationality =  req.data["nationality"]?.string,
            let hospital =  req.data["hospital"]?.string
        else {
            throw Abort.badRequest
        }
        
        let client = Client(name: name, mobile: mobile, age: 30, gender: .male, nationality: nationality, hospital: hospital)
        try client.save()
        print(client)
        return Response(redirect: "/clients")
    }
    
    
}

extension ClientController: ResourceRepresentable {
    func makeResource() -> Resource<Client> {
        return Resource(
            index: index,
            store: newClient
        )
    }
}
