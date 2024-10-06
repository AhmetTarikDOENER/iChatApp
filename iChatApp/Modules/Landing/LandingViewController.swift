import UIKit

final class LandingViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension LandingViewController {
    func setupUI() {
        logoImageView.image = UIImage(named: "appstore", in: Bundle(for: LandingViewController.self), with: nil)
        
    }
}
