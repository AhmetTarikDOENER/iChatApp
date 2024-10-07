import UIKit
import Utility

public final class Builder {
    public static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "IChatRoomLogin", bundle: Bundle.init(for: self))
        let viewController = IChatRoomLoginViewController.instantiate(from: storyboard)
        
        return viewController
    }
}
