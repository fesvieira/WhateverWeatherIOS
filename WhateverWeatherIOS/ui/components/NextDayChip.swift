//
//  NextDayChip.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 27/09/23.
//

import SwiftUI

struct NextDayChip: View {
    var body: some View {
        VStack {
            Text("8/11")
                .foregroundStyle(.white)
                .font(.title2)
            
            Image(systemName: "star.fill")
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
            
            Text("30")
                .foregroundStyle(.white)
                .font(.title2)
        }
        .padding()
        .background(.AppDarkBlue)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 60, height: 60)))
        
    }
}

#Preview {
    NextDayChip()
}
