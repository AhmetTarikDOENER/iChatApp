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
    
    private var presenter: Presentation!
    var presenterProcuder: Presentation.Producer!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = presenterProcuder((
            username: usernameTextField.rx.text.orEmpty.asDriver(),
            email: emailTextField.rx.text.orEmpty.asDriver(),
            login: loginButton.rx.tap.asDriver()
        ))
        setupUI()
        setupBinding()
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        
    }
}

private extension IChatRoomLoginViewController {
    private func setupUI() {
        avatarImageView.image = UIImage(named: "male_icon", in: Bundle(for: IChatRoomLoginViewController.self), with: nil)
    }
    
    func setupBinding() {
        presenter.output.enableLogin
            .drive(loginButton.rx.isEnabled)
            .disposed(by: bag)
    }
}
