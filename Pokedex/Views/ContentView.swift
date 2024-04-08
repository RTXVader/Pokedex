//
//  ContentView.swift
//  Pokedex
//
//  Created by Alex Farran on 08/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
