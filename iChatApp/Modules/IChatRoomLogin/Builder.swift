import UIKit
import Utility

final class Builder {
    public static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "IChatRoomLoginViewController", bundle: Bundle.init(for: self))
        let viewController = IChatRoomLoginViewController.instantiate(from: storyboard)
        
        return viewController
    }
}
