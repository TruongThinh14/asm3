//
//  DataModel.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//

import Foundation


// Message model
struct Message: Identifiable, Codable {
    let id: UUID
    let content: String
    let timestamp: Date
    let sender: String
}

// Thread model
struct Thread: Identifiable, Codable {
    let id: UUID
    let title: String
    var messages: [Message]
}
