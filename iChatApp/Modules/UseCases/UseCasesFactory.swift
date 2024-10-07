import Foundation
import IChatRoomService

public final class UseCasesFactory {
    private static let websocketService = IChatRoomWebSocketService()
    public static var accountInteractor: AccountInteractor = AccountInteractor(chatService: websocketService)
}
