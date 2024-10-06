import Foundation

protocol Routing {
    func routeToLandingPage()
}

final class Presenter: Presentation {
    private let router: Routing
    
    init(router: Routing) {
        self.router = router
    }
}
