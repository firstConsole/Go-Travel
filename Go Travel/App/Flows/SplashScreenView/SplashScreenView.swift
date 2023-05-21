//
//  SplashScreenView.swift
//  Go Travel
//
//  Created by Алексей Артамонов on 21.05.2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    // MARK: - Properties
    
    @State private var isActive: Bool = false
    @State private var size: Double = 0.8
    @State private var opacity: Double = 0.1
    
    // MARK: - Body
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            VStack {
                VStack {
                    Image("go-travel-icon")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .cornerRadius(40)
                        .shadow(radius: 5)
                    
                    Text("Go Travel")
                        .padding()
                        .font(Font.custom("Gotham Pro", size: 48))
                        .foregroundColor(.indigo)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

// MARK: - Preview

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
