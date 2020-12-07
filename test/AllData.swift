//
//  Data.swift
//  test
//
//  Created by Maxim on 03.12.2020.
//  Обработка пришедших данных

import Foundation
struct AllData {
    var id : Int = 0
    var followersCount : Int = 0
    var online : Int = 0
    var bdate : String = "Дата рождения"
    var firstName : String = "Имя"
    var lastName : String = "Фамилия"
    var homeTown : String = "Город"
    var title : String = "Страна"
    var sex : Int = 0
    var sexString : String {
        switch sex {
        case 1: return "Женский"
        case 2: return "Мужской"
        default: return "Не указан"
        }
    }
    var onlineString : String {
        switch online {
        case 1: return "В сети"
        case 0: return "Не в сети"
        default: return "Неизвестно"
        }
    }
    var newHomeTown : String {
        switch homeTown {
        case "": return "Не указан"
        default: return homeTown
        }
    }
    var country : String {
        switch title {
        case "": return "Не указан"
        case "Russia": return "Россия"
        default: return title
        }
    }
    init?(vkData: VkData) {
        firstName = vkData.response.first!.firstName
        lastName = vkData.response.first!.lastName
        homeTown = vkData.response.first!.homeTown
        title = vkData.response.first!.country.title
        sex = vkData.response.first!.sex
        id = vkData.response.first!.id
        bdate = vkData.response.first!.bdate
        online = vkData.response.first!.online
        followersCount = vkData.response.first!.followersCount
    }
    init() {
    }
}
