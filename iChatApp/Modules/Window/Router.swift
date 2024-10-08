import UIKit

final class Router {
    
    private unowned let window: UIWindow
    private let submodules: SubModules
    
    typealias SubModules = (
        landingModule: (_ onStart: @escaping () -> Void) -> UIViewController,
        loginModule: (_ onLogin: @escaping () -> Void) -> UIViewController
    )
    
    init(window: UIWindow, submodules: SubModules) {
        self.window = window
        self.submodules = submodules
    }
}

extension Router: Routing {
    func routeToLandingPage() {
        let landingViewController = submodules.landingModule { [weak self] in
            self?.routeToLogin()
        }
        window.rootViewController = landingViewController
        window.makeKeyAndVisible()
    }
    
    func routeToLogin() {
        let loginViewController = submodules.loginModule { [weak self] in
            
        }
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
}
