import UIKit

final class LandingViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var onStart: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func onStartTapped(_ sender: UIButton) {
        onStart?()
    }
}

private extension LandingViewController {
    func setupUI() {
        logoImageView.image = UIImage(named: "appstore", in: Bundle(for: LandingViewController.self), with: nil)
    }
}
