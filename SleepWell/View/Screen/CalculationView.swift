//
//  CalculationView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/10/23.
//

import SwiftUI
struct CalculationView: View {
    @State private var showingBabyStep = false
    var body: some View {
        VStack {
            Text("Cool!")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 25))
                .padding(.leading, -160)
                .padding(.top, 20)
           
            Text("Now we will remind you to sleep at the time you have been setted at:")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.leading, 20)
                .padding(.top, 5)
            Spacer()
            ZStack {
                Image("CalculationImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 100)
                
                Text("00.00")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Button(action: {
                // Action for the first button
            }) {
                Text("I am confident with it!")
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color.buttonBg)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            
            Button(action: {
                showingBabyStep = true
            }) 
            {
                Text("I am not pretty sure yet.")
                    .padding()
                    .padding(.horizontal, 42)
                    .background(Color.buttonBg)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showingBabyStep) {
                BabyStep()
            }
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 52/255, green: 4/255, blue: 56/255), Color(red: 49/255, green: 31/255, blue: 159/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
