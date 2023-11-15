//
//  SwiftUIView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 14/11/23.
//

import SwiftUI

struct NightView: View {
  
    @State private var activeButton: ActiveButton?
    
    enum ActiveButton {
        case good, happy, calm, enthusiastic, sad, annoyed, tired, angry
    }
    
    var body: some View {
        VStack{
            
            Text("Good Evening, x!")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 12)
            Text("How are you feeling today?")
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
                        activeButton = activeButton == nil ? .good : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.goodbg)
                            .frame(width: activeButton == .good ? 160 : 58, height: 48)
                            .offset(x: activeButton == .good ? 0 : -50)
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
                        activeButton = activeButton == nil ? .happy : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.happybg)
                                .frame(width: activeButton == .happy ? 160 : 58, height: 48)
                                .offset(x: activeButton == .happy ? 0 : -50)
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
                        activeButton = activeButton == nil ? .calm : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.calmbg)
                            .frame(width: activeButton == .calm ? 160 : 58, height: 48)
                            .offset(x: activeButton == .calm ? 0 : -50)
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
                        activeButton = activeButton == nil ? .enthusiastic : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.enthusiasticbg)
                                .frame(width: activeButton == .enthusiastic ? 160 : 58, height: 48)
                                .offset(x: activeButton == .enthusiastic ? 0 : -50)
                            Text("Enthusiastic")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 55)
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
                        activeButton = activeButton == nil ? .sad : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.sadbg)
                            .frame(width: activeButton == .sad ? 160 : 58, height: 48)
                            .offset(x: activeButton == .sad ? 0 : -50)
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
                        activeButton = activeButton == nil ? .annoyed : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.goodbg)
                                .frame(width: activeButton == .annoyed ? 160 : 58, height: 48)
                                .offset(x: activeButton == .annoyed ? 0 : -50)
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
                        activeButton = activeButton == nil ? .tired : nil
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primaryButton, lineWidth: 2)
                            .fill(.clear)
                            .frame(width: 160, height: 48)
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.tiredbg)
                            .frame(width: activeButton == .tired ? 160 : 58, height: 48)
                            .offset(x: activeButton == .tired ? 0 : -50)
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
                        activeButton = activeButton == nil ? .angry : nil
                    }  }, label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.primaryButton, lineWidth: 2)
                                .fill(.clear)
                                .frame(width: 160, height: 48)
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.angrybg)
                                .frame(width: activeButton == .angry ? 160 : 58, height: 48)
                                .offset(x: activeButton == .angry ? 0 : -50)
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


#Preview {
    NightView()
}
