//
//  ReportsAPI.swift
//  App
//
//  Created by SH on 18/12/2017.
//

import Foundation
import Vapor

final class ReportsAPI {
    
    func index(_ req: Request) throws -> ResponseRepresentable {
        let clients = try Client.all()
        var hospitals: [String : Int] = [:]
        
        for client in clients {
            if hospitals.keys.contains(client.hospital) {
                hospitals["\(client.hospital)"]! += 1
            } else {
                hospitals["\(client.hospital)"] = 1
            }
        }
        
        let json = hospitals.toJSON()
        return json
    }
    
    func addRoutes(_ drop: Droplet) {
        let reportsAPI = drop.grouped("reportsapi")
        reportsAPI.get(handler: index)
        
    }
}
