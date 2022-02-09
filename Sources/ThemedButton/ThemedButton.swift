
import SwiftUI

typealias TextContent = () -> String

public struct ThemedButton: View  {
    let text: String
    let action: () -> Void
    let color: String

    public init(text: String, action:  @escaping () -> Void) {
        self.text = text
        self.action = action
    }


    public var body: some View {
        HStack {
            Button(action: action) {
                Text(text.uppercased()).padding()
            }.padding()
        }
    }
}
