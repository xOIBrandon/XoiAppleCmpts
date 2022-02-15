
import SwiftUI

public struct ThemedButton: View  {
    @EnvironmentObject var theme: Theme
    let text: String
    let action: () -> Void
    let color: String

    public init(text: String, action:  @escaping () -> Void) {
        self.text = text
        self.action = action
        self.color = ""
    }


    public var body: some View {
        let main = theme.buttonVariants.main
        
        return HStack {
            Button(action: action) {
                Text(text.uppercased())
                    .foregroundColor(Color(hex: main.textColor))
                    .fontWeight(.semibold)
            }
        }.buttonStyle(PlainButtonStyle.plain)
         .padding()
         .background(Color(hex: main.backgroundColor))
         .cornerRadius(CGFloat(main.borderRadius))
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ThemedButton(text: "Press me") {
            print("I've been pressed")
        }.environmentObject(Theme.values)
    }
}
