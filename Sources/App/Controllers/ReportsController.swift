//
//  ReportsController.swift
//  vaporWebAuth
//
//  Created by SH on 16/12/2017.
//

import Vapor
// import Quartz.PDFKit

final class ReportsController {
    
    let view: ViewRenderer
    
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    // MARK: -  GET [index] /report -
    func index(_ req: Request) throws -> ResponseRepresentable {
        let clients = try Client.all()
        var hospitals: [Hospital] = []
        
        for client in clients {
            let hospital = Hospital(name: client.hospital)
            if hospitals.contains(hospital) {
                let index = hospitals.index(of: hospital)
                let h = hospitals[index!]
                h.incrementCount()
            } else {
                hospitals.append(hospital)
            }
//            if hospitals.keys.contains(client.hospital) {
//                hospitals["\(client.hospital)"]! += 1
//            } else {
//                hospitals["\(client.hospital)"] = 1
//            }
        }
        
        for hospital in hospitals {
            hospital.calculatePercentate(In: clients.count)
        }
        
//        for (key, value) in hospitals {
//            let newValue = (value * 100) / clients.count
//            hospitals["\(key)"] = newValue
//        }
        let parameters = try Node(node: [
            "clients": clients,
            "hospitals": hospitals
            ])
//        for client in clients {
//            if let id = client.id?.string {
//                print(id)
//            }
//        }
        return try view.make("reports", parameters)
    }
}

extension ReportsController: ResourceRepresentable {
    func makeResource() -> Resource<Client> {
        return Resource(
            index: index
//            create: create,
//            store: store,
//            show: show,
//            update: update
        )
    }
}

