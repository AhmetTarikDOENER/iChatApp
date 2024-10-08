import UIKit

typealias IChatTabs = ()

protocol TabbarView: AnyObject {
    
}

final class IChatTabbarViewController: UITabBarController {

    init(tabs: IChatTabs) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension IChatTabbarViewController: TabbarView {
    
}
