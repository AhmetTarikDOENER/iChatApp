import Foundation
import RxSwift
import IChatRoomService

public final class AccountInteractor {
    private let chatService: ChatRoomWebSocketAPI
    
    init(chatService: ChatRoomWebSocketAPI) {
        self.chatService = chatService
    }
}

public extension AccountInteractor {
    func login(username: String, email: String) -> Single<()> {
        self.chatService.login(username: username, email: email)
        return .never()
    }
}
