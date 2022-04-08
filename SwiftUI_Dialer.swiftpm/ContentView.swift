import SwiftUI

struct ContentView: View {
    private static var colors: [Color] = [
        Color("GradientTopColor"), Color("GradientMiddleColor"), Color("GradientBottomColor")
    ]
    
    @State private var dialedNumbers: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: Self.colors, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                Text(dialedNumbers)
                    .frame(height: 24) // prevent the dialer from moving after text is added. (empty text has no size)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                DialerView(dialedNumbers: $dialedNumbers)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
