import Foundation
@_implementationOnly import RxCocoa
@_implementationOnly import RxSwift

protocol Presentation {
    typealias Input = (
        username: Driver<String>,
        email: Driver<String>
    )
    typealias Output = (
        enableLogin: Driver<Bool>, ()
    )
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
        let enableLoginDriver = Driver.combineLatest(input.username.map({ !$0.isEmpty }), input.email.map({ $0.isEmail() })).map({ $0 && $1 })
        return (
            enableLogin: Driver.never(), ()
        )
    }
    
    func process() {
        
    }
}
