import UIKit
@_implementationOnly import RxCocoa
@_implementationOnly import RxSwift

final class IChatRoomLoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension IChatRoomLoginViewController {
    private func setupUI() {
        avatarImageView.image = UIImage(named: "male_icon", in: Bundle(for: IChatRoomLoginViewController.self), with: nil)
    }
}
