import Foundation
import RxSwift
import RxRelay
import IChatRoomService
import Models

public final class AccountInteractor {
    private let chatService: ChatRoomWebSocketAPI
    private let userRelay: BehaviorRelay<User?> = BehaviorRelay(value: nil)
    public lazy var user: Observable<User?> = userRelay.asObservable()
    
    init(chatService: ChatRoomWebSocketAPI) {
        self.chatService = chatService
    }
}

public extension AccountInteractor {
    func login(username: String, email: String) -> Single<()> {
        return self.chatService.socketResponse.filter {
            guard case .loggedIn = $0 else { return false }
            return true
        }.map { result -> User? in
            guard case .loggedIn(let username, let email) = result else { return nil }
            return User(email: username, username: email)
        }
        .take(1)
        .flatMap(saveUser(user:))
        .asSingle()
        .do { [weak self] in
            self?.chatService.login(username: username, email: email)
        }
    }
}

private extension AccountInteractor {
    func saveUser(user: User?) -> Single<()> {
        userRelay.accept(user)
        return .just(())
    }
}
