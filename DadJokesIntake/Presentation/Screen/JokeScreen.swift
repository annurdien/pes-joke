//
//  JokeScreen.swift
//  DadJokesIntake
//
//  Created by Annurdien Rasyid on 07/09/24.
//

import SwiftUI


struct JokeScreen: View {
    @StateObject var vm = JokeViewModel()
    
    var body: some View {
        ZStack {
            Color(.fatherlyChcholate)
                .ignoresSafeArea()
            VStack {
                Spacer()
                JokeView(joke: vm.joke)
                    .padding()
                    .padding()
                Spacer()
                vm.getPesView()
                    .frame(width: 250, height: 250)
                    .onTapGesture(perform: vm.getJoke)
            }
        }.alert(
            "Ups, something went wrong!",
            isPresented: $vm.shouldShowError
        ) { Button("OK") {} } message: {
            Text(vm.errorMessage ?? "Something went wrong, try again later!")
        }
    }
}

#Preview {
    JokeScreen()
}
