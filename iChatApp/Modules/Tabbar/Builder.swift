import UIKit

public final class Builder {
    public static func build() -> UITabBarController {
        let subModules: Router.SubModules = ()
        let tabs: IChatTabs = Router.tabs(for: subModules)
        let presenter = Presenter(useCases: ())
        let tabbarController = IChatTabbarViewController(tabs: tabs)
        presenter.view = tabbarController
        tabbarController.presenter = presenter
        
        return tabbarController
    }
}
