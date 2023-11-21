//
//  FeatureView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//
import SwiftUI
struct FeatureView: View {
    @Binding var screen: Int
    @State private var currentPage = 0
    let featuresData: [FeatureScreenData] = [
        FeatureScreenData(title: "Plan", description: "Help you to schedule your bed time, slowly, but consistently.", imageName: "PlanImage"),
        FeatureScreenData(title: "Track", description: "Help you to track your progress in improving your sleep schedule.", imageName: "TrackImage"),
        FeatureScreenData(title: "Remind", description: "Remind you about what habit you can improve to have a better sleeping schedule.", imageName: "RemindImage")
    ]
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentPage) {
                ForEach(0..<featuresData.count, id: \.self) { index in
                    FeatureScreenView(featureScreenData: featuresData[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(
                Image("blankbg")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            )
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        
                        if currentPage == featuresData.count - 1 {
                                Button(action: {
                                    withAnimation {
                                        screen += 1
                                    }
                                }) {
                                    Text("Get Started")
                                        .frame(maxWidth: 340, maxHeight: 60)
                                        .background(Color.primaryButton)
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .offset(y: 18)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // PageControl with circle dots
                    PageControl(numberOfPages: featuresData.count, currentPage: $currentPage)
                        .padding(.bottom, 20)
                }
                .navigationBarHidden(true)
            )
        }.overlay(
            // Skip Button
            Button(action: {
                // Handle the action for "Skip"
                withAnimation {
                    screen += 2
                }
            }) {
                Text("Skip")
                    .padding(.horizontal, 23)
                    .padding(.vertical, 54)
                    .foregroundColor(.BarIconColor)
                    .cornerRadius(10)
            }
            , alignment: .topTrailing
        )
    }
}

struct FeatureScreenData {
    let title: String
    let description: String
    let imageName: String
}

struct FeatureScreenView: View {
    var featureScreenData: FeatureScreenData
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Spacer()
                Group {
                    Text(featureScreenData.title)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text(featureScreenData.description)
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(featureScreenData.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 241, height: 221)
                    Spacer()
                }
                Spacer(minLength: 250)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.white : Color.primaryButton)
                    .frame(width: 8, height: 8)
                    .offset(y: 18)
            }
        }
    }
}

#Preview {
    FeatureView(screen: .constant(1))
}
