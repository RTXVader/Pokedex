//
//  PokemonView.swift
//  Pokedex
//
//  Created by Alex Farran on 08/04/2024.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                    } else if phase.error != nil {
                        // Handle error
                        Text("Failed to load image")
                    } else {
                        // Placeholder
                        ProgressView()
                            .frame(width: dimensions, height: dimensions)
                    }
                }
                .background(.thinMaterial)
                .clipShape(Circle())

                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                    .padding(.bottom, 20)
            }
        }
    }
struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
