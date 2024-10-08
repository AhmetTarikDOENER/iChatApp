import Foundation
@_implementationOnly import SocketIO

public protocol ChatRoomWebSocketAPI {
    func login(username: String, email: String)
}

public final class IChatRoomWebSocketService {
    private var scoketManager: SocketManager!
    private var socket: SocketIOClient!
    
    public init() { }
    deinit { socket.disconnect() }
    
}

extension IChatRoomWebSocketService: ChatRoomWebSocketAPI {
    public func login(username: String, email: String) {
        print("Login request received", username, email)
    }
}

extension IChatRoomWebSocketService {
    func setup(socketURL: URL) {
        scoketManager = SocketManager(socketURL: socketURL)
        socket = self.scoketManager.defaultSocket
        socket.connect()
    }
}
