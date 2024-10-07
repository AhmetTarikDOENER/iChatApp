import Foundation

public protocol ChatRoomWebSocketAPI {
    func login(username: String, email: String)
}

public final class IChatRoomWebSocketService {
    public init() {
        
    }
}

extension IChatRoomWebSocketService: ChatRoomWebSocketAPI {
    public func login(username: String, email: String) {
        print("Login request received", username, email)
    }
}
