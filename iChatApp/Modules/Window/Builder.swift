import UIKit
import Landing
import IChatRoomLogin
import Tabbar

public final class Builder {
    public static func build(windowScene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: windowScene)
        let landingModule = Landing.Builder.build
        let loginModule = IChatRoomLogin.Builder.build
        let tabbarModule = Tabbar.Builder.build
        let router = Router(
            window: window,
            submodules: (
                landingModule: landingModule,
                loginModule: loginModule,
                tabbarModule: tabbarModule
            )
        )
        let presenter = Presenter(router: router)
        window.presenter = presenter
        
        return window
    }
}
