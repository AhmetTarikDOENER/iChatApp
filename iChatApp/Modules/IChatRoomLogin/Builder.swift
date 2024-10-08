import UIKit
import Utility
import UseCases

public final class Builder {
    public static func build(onLogin: @escaping () -> Void) -> UIViewController {
        let storyboard = UIStoryboard(name: "IChatRoomLogin", bundle: Bundle.init(for: self))
        let viewController = IChatRoomLoginViewController.instantiate(from: storyboard)
        let accountInteractor = UseCasesFactory.accountInteractor
        let router = Router(viewController: viewController, onLogin: onLogin)
        viewController.presenterProcuder = {
            Presenter(
                input: $0,
                router: router,
                useCases: (
                    login: accountInteractor.login, ()
                )
            )
        }
        
        return viewController
    }
}
