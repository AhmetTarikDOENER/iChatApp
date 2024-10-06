import Foundation

protocol Routing {
    func routeToLandingPage()
}

final class Presenter: Presentation {
    private let router: Routing
    
    init(router: Routing) {
        self.router = router
        process()
    }
}

private extension Presenter {
    func process() {
        router.routeToLandingPage()
    }
}
