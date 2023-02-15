//
//  LaunchesResponse.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 12/02/2023.
//

import Foundation

struct Launches: Codable {
    let success: Bool?
    let rocket: String?
    let name: String?
    let id: String?
    let date_local: String?
    let details: String?
    let flight_number: Int?
}
