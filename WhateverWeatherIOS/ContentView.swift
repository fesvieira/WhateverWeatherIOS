//
//  ContentView.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentCity = ""
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text("C")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.AppDarkBlue)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ZStack{
                        
                    }
                    .frame(width: 180, height: 180)
                    .background(.NightGradientTop)
                    
                    Text("Colorado, Paraná")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    Text("29")
                        .foregroundStyle(.white)
                        .font(.custom("system", size: 120))
                    
                    Text("Sunny")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    HStack {
                        ForEach(0..<3) { _ in
                            NextDayChip()
                        }
                    }
                }
                .padding()
            }
            
            FormsTextField(
                text: $currentCity,
                placeholder: "Type a city"
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.SunnyGradientTop)
    }
}
/*
 NavigationView {
 List(model.notes) { note in
 NavigationLink(note.title, destination: NoteEditor(id: note.id))
 }
 Text("Select a Note")
 }
 */
#Preview {
    ContentView()
}
