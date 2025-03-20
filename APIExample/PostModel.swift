//
//  PostModel.swift
//  APIExample
//
//  Created by Mac on 19/09/1446 AH.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
