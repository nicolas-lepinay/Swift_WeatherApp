//
//  HomeView.swift
//  WeatherApp
//
//  Created by Nicolas Lépinay on 12/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // MARK: Background Color
            Color.background
                .ignoresSafeArea()
            
            // MARK: Background Image
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            // MARK: House Image
            Image("House")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            
            VStack(spacing: -10) {
                Text("Paris")
                    .font(.largeTitle)
                
                VStack {
                    Text(attributedString)
                    
                    Text("24°   18°")
                        .font(.title3.weight(.semibold))
                }
                
                Spacer()
            }
            .padding(.top, 51)
        }
    }
    
    private var attributedString :AttributedString {
        var string = AttributedString("19°" + "\n " + "    Ensoleillé")
        
        if let temperature = string.range(of: "19°") {
            string[temperature].font = .system (size: 96, weight: .thin)
            string[temperature].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Ensoleillé") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
