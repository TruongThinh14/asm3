//
//  ContentView.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var showingNewStatus = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Thread App!")
                    .font(.largeTitle)
                    .padding()

                // Your main content goes here, such as a list of threads
                // For demonstration, a simple text placeholder
                List {
                    Text("Thread Post 1")
                    Text("Thread Post 2")
                    Text("Thread Post 3")
                }
                
                Spacer()
            }
            .navigationTitle("How do you feel today?").padding(0).font(.system(size: 16)).bold()
            .navigationBarItems(trailing: Button(action: {
                showingNewStatus.toggle()
            }) {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
        .sheet(isPresented: $showingNewStatus) {
            NewStatusView()
        }
    }
}

struct NewStatusView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var statusText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("What's on your mind?", text: $statusText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    // Handle posting the new status
                    print("New status posted: \(statusText)")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Post")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("New Post")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
