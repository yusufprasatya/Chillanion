//
//  Screen8View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 17/10/23.
//

import SwiftUI

struct Screen30View: View {
    @State var name: String = ""
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                Spacer()
                HStack{
                    Spacer()
                    ZStack {
                        CircularDotProgressView()
                        Image("koalaInTheMoon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 114)
                            .padding(.leading, -25)
                        
                    }
                    .border(.red)
                    .padding()
                    Spacer()
                }
                
                VStack{
                    Text("Give us a second!")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    Text("Give us a second! We will give you the calculation of your sleep duration!")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                Spacer()
                Spacer()
                
            }
            .border(.red)
            .padding(.horizontal)
        }
    }
}

#Preview {
    Screen30View()
}
