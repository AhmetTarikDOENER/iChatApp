import UIKit

final class Router {
    
    private unowned let window: UIWindow
    private let submodules: SubModules
    
    typealias SubModules = (landingModule: () -> UIViewController, Void)
    
    init(window: UIWindow, submodules: SubModules) {
        self.window = window
        self.submodules = submodules
    }
}

extension Router: Routing {
    func routeToLandingPage() {
        let landingViewController = submodules.landingModule()
        window.rootViewController = landingViewController
        window.makeKeyAndVisible()
    }
}
