import UIKit

protocol Routing {
    
}

final class Router {
    typealias SubModules = (
        
    )
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Router: Routing {
    
}

extension Router {
    static func tabs(using subModules: SubModules) -> IChatTabs {
        return ()
    }
}
