import UIKit

public final class Builder {
    public static func build(windowScene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: windowScene)
        let router = Router()
        let presenter = Presenter(router: router)
        
        window.presenter = presenter
        
        return window
    }
}
