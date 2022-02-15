import Foundation


struct Palette: Decodable {
    var green = "#257908"
    var greenLight = "#529939"
    var blue = "#004990"
    var blueDark = "#0F263D"
    var blueLight = "#6AA1DD"
    var blueLightAlt = "#4042EE"
    var blueLighter = "#5468FF"
    var blueLightest = "#E2F0FF"
    var black = "#000000"
    var grayDark = "#52566E"
    var grayLight = "#CCCCCC"
    var grayLighter = "#E6E6E6"
    var grayLightest = "#F6F7FB"
    var red = "#BD5D59"
    var white = "#FFFFFF"
    var gold = "#F8AC1E"
}

struct Colors: Decodable {
    var primary = Palette().blue
    var primaryDark = Palette().blueDark
    var primaryMuted = Palette().blueLight
    var secondary = Palette().blueLight
    var text = Palette().black
    var btnText = Palette().white
}

struct Spacing: Decodable {
    var zero = 0
    var xxxs = 1
    var xxs = 3
    var xs = 4
    var s = 8
    var m = 12
    var l = 16
    var xl = 20
    var xxl = 32
    var xxxl = 42
    var xxxxl = 50
    var xxxxxl = 83
}

struct BorderRadii: Decodable {
    var corner = 10
    var icon = 8
    var base = 4
    var tag = 3
    var inputText = 3
    var shadow = 4
    var cardListItem = 3
    var buttonMain = 15
    var buttonInner = 20
    var buttonRounded = 50
    var thumbnail = 4
}

struct ButtonStyle: Decodable {
    var borderRadius: Int
    var backgroundColor: String
    var textColor: String
}

struct ButtonVariants: Decodable {
    var main = ButtonStyle(borderRadius: BorderRadii().buttonMain, backgroundColor: Colors().primary, textColor: Colors().btnText)
}

struct ThemeSchema: Decodable {
    var colors = Colors()
    var borderRadii = BorderRadii()
    var buttonVariants = ButtonVariants()
    var spacing = Spacing()
}

class Theme: ObservableObject {
    @Published var colors = Colors()
    @Published var borderRadii = BorderRadii()
    @Published var buttonVariants = ButtonVariants()
    @Published var spacing = Spacing()
    
    // Create single instance of Theme as static property on itself
    static var values = Theme()
    
    // Disable creating instances of this class
    private init() { }

    func updateThemeFromJson(json: Data) throws -> Void {
        if let theme = try? decodeJson(json) {
            // TODO: Merge decoded json with existing default values. Right now we are just overwriting everything
            colors = theme.colors
            borderRadii = theme.borderRadii
            buttonVariants = theme.buttonVariants
            spacing = theme.spacing
        }
    }
    
    enum ParseThemeError: Error {
        case badJson
    }
    
    private func decodeJson(_ json: Data) throws -> ThemeSchema {
        let decoder = JSONDecoder()
        
        if let theme = try? decoder.decode(ThemeSchema.self, from: json) {
            return theme
        }
        
        throw ParseThemeError.badJson
    }
}
