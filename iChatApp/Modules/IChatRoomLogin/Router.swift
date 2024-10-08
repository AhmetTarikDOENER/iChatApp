import UIKit

protocol Routing {
    func routeToWindow()
}

final class Router {
    private weak var viewController: UIViewController?
    private let onLogin: () -> Void
    
    init(viewController: UIViewController, onLogin: @escaping () -> Void) {
        self.viewController = viewController
        self.onLogin = onLogin
    }
}

extension Router: Routing {
    func routeToWindow() {
        onLogin()
    }
}
