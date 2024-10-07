import Foundation

protocol Presentation {
    typealias Input = ()
    typealias Output = ()
    typealias Producer = (Presentation.Input) -> Presentation
    var input: Input { get }
    var output: Output { get }
}

final class Presenter: Presentation {
    typealias UseCases = ()
    var input: Input
    var output: Output
    private let useCases: UseCases
    private let router: Routing
    
    init(input: Input, router: Routing, useCases: UseCases) {
        self.input = input
        self.output = Presenter.output(input: input)
        self.router = router
        self.useCases = useCases
        self.process()
    }
}

private extension Presenter {
    static func output(input: Input) -> Output {
        return ()
    }
    
    func process() {
        
    }
}
