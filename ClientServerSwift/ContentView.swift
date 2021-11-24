//
//  ContentView.swift
//  ClientServerSwift
//
//  Created by Vlad Gershun on 11/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var host: String = "127.0.0.1"
    @State private var port: String = "49999"
    @State private var message: String = ""
    var body: some View {
        VStack {
            TextField("Host", text: $host)
            TextField("Port", text: $port)
            
            Button("Connect") {
                do {
                    message = try runClient(host: host, port: port)
                } catch {
                    message = error.localizedDescription
                }
            }
            Text("Result:")
            Text(message)
                .lineLimit(4)
        }
        .frame(width: 300, height: 200)
        .padding(80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    
}
