//
//  WakeUpView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 15/11/23.
//

import SwiftUI

struct WakeUpView: View {
  
    @State private var activeButton: ActiveButton?
    
    enum ActiveButton {
        case good2, happy2, calm2, refreshed2, sad2, annoyed2, tired2, angry2
    }
    
    var body: some View {
        VStack{
            
            Text("Good Morning, x!")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 12)
            Text("How are you feeling when you wake up?")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .font(.system(size: 17))
                .padding(.bottom, 27)
            Text("Positive Feeling🌈")
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .alignmentGuide(HorizontalAlignment.leading) { _ in 0 }
                .padding(.leading, 32)
                .padding(.bottom, 24)
            HStack{
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .good2 : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.goodbg)
                            .frame(width: activeButton == .good2 ? 160 : 58, height: 48)
                            .offset(x: activeButton == .good2 ? 0 : -50)
                        Text("Good")
                            .foregroundStyle(Color.white)
                            .padding(.leading, 5)
                            .font(.system(size: 17))
                        Text("😊")
                            .font(.system(size: 35))
                            .offset(x: -50)
                            .foregroundColor(.white) // Adjust the color as needed
                    }
                })
                
                
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .happy2 : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.happybg)
                                .frame(width: activeButton == .happy2 ? 160 : 58, height: 48)
                                .offset(x: activeButton == .happy2 ? 0 : -50)
                            Text("Happy")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 12)
                                .font(.system(size: 17))
                            Text("😆")
                                .font(.system(size: 35))
                                .offset(x: -50)
                                .foregroundColor(.white) // Adjust the color as needed
                        }
                    })
            }.padding(.bottom, 15)
            HStack{
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .calm2 : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.calmbg)
                            .frame(width: activeButton == .calm2 ? 160 : 58, height: 48)
                            .offset(x: activeButton == .calm2 ? 0 : -50)
                        Text("Calm")
                            .foregroundStyle(Color.white)
                            .padding(.leading, 2)
                            .font(.system(size: 17))
                        Text("😌")
                            .font(.system(size: 35))
                            .offset(x: -50)
                        
                    }
                })
                
                
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .refreshed2 : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.enthusiasticbg)
                                .frame(width: activeButton == .refreshed2 ? 160 : 58, height: 48)
                                .offset(x: activeButton == .refreshed2 ? 0 : -50)
                            Text("Refreshed")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 40)
                                .font(.system(size: 17))
                            Text("😆")
                                .font(.system(size: 35))
                                .offset(x: -50)
                                .foregroundColor(.white) // Adjust the color as needed
                        }
                    })
            }
            Text("Negative Feeling 🌧️")
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 32)
                .padding(.top, 67)
                .padding(.bottom, 31)
            HStack{
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .sad2 : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.sadbg)
                            .frame(width: activeButton == .sad2 ? 160 : 58, height: 48)
                            .offset(x: activeButton == .sad2 ? 0 : -50)
                        Text("Sad")
                            .foregroundStyle(Color.white)
                            .padding(.leading, -5)
                            .font(.system(size: 17))
                        Text("☹️")
                            .font(.system(size: 35))
                            .offset(x: -50)
                            .foregroundColor(.white) // Adjust the color as needed
                    }
                })
                
                
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .annoyed2 : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.goodbg)
                                .frame(width: activeButton == .annoyed2 ? 160 : 58, height: 48)
                                .offset(x: activeButton == .annoyed2 ? 0 : -50)
                            Text("Annoyed")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 30)
                                .font(.system(size: 17))
                            Text("😒")
                                .font(.system(size: 35))
                                .offset(x: -50)
                                .foregroundColor(.white) // Adjust the color as needed
                        }
                    })
            }.padding(.bottom, 15)
            HStack{
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .tired2 : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.tiredbg)
                            .frame(width: activeButton == .tired2 ? 160 : 58, height: 48)
                            .offset(x: activeButton == .tired2 ? 0 : -50)
                        Text("Tired")
                            .foregroundStyle(Color.white)
                            .padding(.leading, 5)
                            .font(.system(size: 17))
                        Text("😔")
                            .font(.system(size: 35))
                            .offset(x: -50)
                    }
                })
                
                
                Button(action: {
                    withAnimation{
                        activeButton = activeButton == nil ? .angry2 : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.angrybg)
                                .frame(width: activeButton == .angry2 ? 160 : 58, height: 48)
                                .offset(x: activeButton == .angry2 ? 0 : -50)
                            Text("Angry")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 9)
                                .font(.system(size: 17))
                            Text("😠")
                                .font(.system(size: 35))
                                .offset(x: -50)
                                
                        }
                    })
            }
            Button(action: {
                // Handle the action when the button is clicked
            }) {
                Text("Continue")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .frame(width: 320, height: 48)
                    .background(activeButton != nil ? Color.primaryButton : Color.gray) // Use blue color if an active button is chosen, otherwise use gray color
                    .cornerRadius(20)
            }
            .padding(.top, 80)
            .disabled(activeButton == nil)
        } .background(
            Image("blankbg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            )
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius: CGFloat = 20
        let width = rect.size.width
        let height = rect.size.height
        
        // Create the rounded rectangle path
        path.addRoundedRect(in: CGRect(x: 0, y: 0, width: width - radius, height: height), cornerSize: CGSize(width: radius, height: radius))
        
        // Create the square right side path
        path.addRect(CGRect(x: width - radius, y: 0, width: radius, height: height))
        
        return path
    }
}

#Preview {
    WakeUpView()
}
