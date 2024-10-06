import UIKit

public extension UIViewController {
    class func instantiate<T: UIViewController>(from storyboard: UIStoryboard, forIdentifier identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, forIdentifier: String(describing: self))
    }
    
    class func instantiate() -> Self {
        let className = String(describing: self)
        
        return instantiate(from: UIStoryboard(name: className, bundle: Bundle(for: self)), forIdentifier: className)
    }
}
