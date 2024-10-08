import Foundation
@_implementationOnly import SocketIO

public protocol ChatRoomWebSocketAPI {
    func login(username: String, email: String)
}

public final class IChatRoomWebSocketService {
    private var socketURL: String
    private var scoketManager: SocketManager!
    private var socket: SocketIOClient!
    
    public init(socketURL: String) {
        self.socketURL = socketURL
        setup(socketURL: URL(string: socketURL)!)
    }
    
    deinit { socket.disconnect() }
}

//  MARK: - ChatRoomWebSocketAPI
extension IChatRoomWebSocketService: ChatRoomWebSocketAPI {
    public func login(username: String, email: String) {
        print("Login request received", username, email)
        socket.emit(ChatSocket.Request.login, username, email)
    }
}

enum ChatSocket {
    struct Request {
        static let login = "login"
    }
    
    struct Response {
        static let loginResponse = "loginResponse"
    }
}

private extension IChatRoomWebSocketService {
    func setup(socketURL: URL) {
        scoketManager = SocketManager(socketURL: socketURL)
        socket = self.scoketManager.defaultSocket
        socket.connect()
        socket.on(ChatSocket.Response.loginResponse) { (dataArray, socketAck) in
            print("Login", dataArray)
        }
    }
}
