//
//  VkData.swift
//  test
//
//  Created by Maxim on 03.12.2020.
//  Пришедшие данные

import Foundation

struct VkData: Decodable {
    let response : [Response]
}

struct Response : Decodable {
    let firstName : String
    let id : Int
    let online : Int
    let lastName : String
    let sex : Int
    let bdate : String
    let homeTown : String
    let followersCount: Int
    let country : Country
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case sex, id, country, bdate, online
        case homeTown = "home_town"
        case followersCount = "followers_count"
    }
}
struct Country : Decodable {
    let title : String
}
