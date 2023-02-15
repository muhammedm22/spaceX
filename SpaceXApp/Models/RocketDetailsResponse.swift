//
//  RocketDetailsResponse.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 15/02/2023.
//

import Foundation

struct Rocket: Codable {
    let name: String?
    let description: String?
    let links: RocketLinks?
    let wikipedia: String?
}
struct RocketLinks: Codable {
    let patch: RocketPatchImages?
    let wikipedia: String?
}

struct RocketPatchImages: Codable {
    let small: String?
    let large: String?
}
