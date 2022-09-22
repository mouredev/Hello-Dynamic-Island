//
//  ContentView.swift
//  DynamicIsland
//
//  Created by Brais Moure on 20/9/22.
//

import SwiftUI

struct ContentView: View {
    
    private let showDynamicIsland = UIDevice.current.name.contains("iPhone 14 Pro")
    
    var body: some View {
        VStack {
            Image(systemName: "message.badge")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 64)
                .foregroundColor(.accentColor)
            
            Text("¡Hola Isla Dinámica!")
                .font(.title)
            
            if showDynamicIsland {
                Button("Mostrar") {
                    NotificationCenter.default.post(name: .init("DYNAMIC_ISLAND"), object: "¡Estoy aquí!")
                }.buttonStyle(.borderedProminent)
            } else {
                Text("Oops... Isla dinámica no soportada")
                    .foregroundColor(.red)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .top) {
            if showDynamicIsland {
                DynamicIslandView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
