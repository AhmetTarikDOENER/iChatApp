import Foundation

protocol Presentation {
    
}

final class Presenter {
    var useCases: UseCases
    weak var view: TabbarView?
    
    init(useCases: UseCases) {
        self.useCases = useCases
    }
}

extension Presenter: Presentation {
    typealias UseCases = ()
}
