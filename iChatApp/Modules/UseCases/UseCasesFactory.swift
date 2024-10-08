import Foundation
import IChatRoomService

public final class UseCasesFactory {
    static let deployURL = "https://damp-beach-81446.herokuapp.com/"
    private static let websocketService = IChatRoomWebSocketService(socketURL: deployURL)
    public static var accountInteractor: AccountInteractor = AccountInteractor(chatService: websocketService)
}
