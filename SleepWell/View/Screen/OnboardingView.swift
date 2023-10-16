
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        WalkthroughView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct WalkthroughView: View {
    @State private var currentPage = 0

    let walkthroughData: [WalkthroughScreenData] = [
        WalkthroughScreenData(title: "Welcome", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", imageName: "welcome_image"),
        WalkthroughScreenData(title: "Explore", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", imageName: "welcome_image"),
        WalkthroughScreenData(title: "Get Started", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", imageName: "welcome_image")
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<walkthroughData.count, id: \.self) { index in
                    WalkthroughScreen(walkthroughData: walkthroughData[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(Color.purpleBg)
            .overlay(
                VStack {
                    Spacer()
                    Button(action: {
                                           if currentPage < walkthroughData.count - 1 {
                                               withAnimation {
                                                   currentPage += 1
                                               }
                                           }
                                       }){
                        Text("Next")
                                               .padding(.horizontal, 100)          .padding(.vertical, 15)
                            .background(Color.white)
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                            
                    }
                    .padding()
                    .padding(.bottom, 40) // Adjust the spacing between the button and PageControl
                    PageControl(numberOfPages: walkthroughData.count, currentPage: $currentPage)
                        .padding(.bottom, 20) // Adjust the spacing between the PageControl and description
                }
            )
        }
    }
}

struct WalkthroughScreenData {
    let title: String
    let description: String
    let imageName: String
}

struct WalkthroughScreen: View {
    var walkthroughData: WalkthroughScreenData

    var body: some View {
        ZStack {
            // Your existing content for the walkthrough screen
            VStack(spacing: 20) {
                // Rest of your existing content

                Spacer()
                
                Image(walkthroughData.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 40)

                Text(walkthroughData.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 10)

                Text(walkthroughData.description)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20) // Adjust the spacing between description and the PageControl
                Spacer()
                Spacer()
            }
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { index in
                Circle()
                    .fill(index == currentPage ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
    }
}
