import UIKit
import Utility

public final class Builder {
    public static func build(completion: @escaping () -> Void) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Landing", bundle: Bundle.init(for: self))
        let viewController = LandingViewController.instantiate(from: storyboard)
        viewController.onStart = completion
        
        return viewController
    }
}
