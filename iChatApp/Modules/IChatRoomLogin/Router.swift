import UIKit

protocol Routing {
    
}

final class Router {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Router: Routing {
    
}
