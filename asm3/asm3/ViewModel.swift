//
//  ViewModel.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//

import Foundation
import SwiftUI
import Combine

class ThreadViewModel: ObservableObject {
    @Published var threads: [Thread] = []
    
    init() {
        loadSampleData()
    }
    
    func loadSampleData() {
        // Sample data for demonstration
        let sampleMessages = [
            Message(id: UUID(), content: "Hello Thinh", timestamp: Date(), sender: "Triet"),
            Message(id: UUID(), content: "Hello Triet", timestamp: Date(), sender: "Thinh")
        ]
        
        let sampleThreads = [
            Thread(id: UUID(), title: "Discussion", messages: sampleMessages)
        ]
        
        self.threads = sampleThreads
    }
    
    func addMessage(to threadId: UUID, message: Message) {
        if let index = threads.firstIndex(where: { $0.id == threadId }) {
            threads[index].messages.append(message)
        }
    }
}
