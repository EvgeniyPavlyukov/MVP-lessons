//
//  Person.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 12.11.2022.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
