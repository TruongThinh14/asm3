//
//  MessageListView.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//

import Foundation
import SwiftUI

struct MessageListView: View {
    let thread: Thread
    @ObservedObject var viewModel: ThreadViewModel
    @State private var newMessageContent: String = ""
    
    var body: some View {
        VStack {
            List(thread.messages) { message in
                VStack(alignment: .leading) {
                    Text(message.sender).font(.headline)
                    Text(message.content).font(.body)
                    Text("\(message.timestamp, formatter: dateFormatter)").font(.caption).foregroundColor(.gray)
                }
            }
            
            HStack {
                TextField("New message...", text: $newMessageContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
        .navigationTitle(thread.title)
    }
    
    private func sendMessage() {
        let newMessage = Message(
            id: UUID(),
            content: newMessageContent,
            timestamp: Date(),
            sender: "You"
        )
        viewModel.addMessage(to: thread.id, message: newMessage)
        newMessageContent = ""
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
