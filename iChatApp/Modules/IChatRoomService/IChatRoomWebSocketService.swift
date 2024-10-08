import Foundation
import SocketIO
import RxSwift
import RxRelay
import Models

public protocol ChatRoomWebSocketAPI {
    var socketResponse: Observable<IChatRoomWebSocket.Response> { get }
    func login(username: String, email: String)
}

public final class IChatRoomWebSocketService {
    private var socketURL: String
    private var scoketManager: SocketManager!
    private var socket: SocketIOClient!
    private let socketResponseRelay: PublishRelay<IChatRoomWebSocket.Response> = PublishRelay()
    public lazy var socketResponse: Observable<IChatRoomWebSocket.Response> = socketResponseRelay.asObservable()
    
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
        socket.on(ChatSocket.Response.loginResponse) { [weak self] (dataArray, socketAck) in
            if let username = dataArray[0] as? String,
               let email = dataArray[1] as? String {
                self?.socketResponseRelay.accept(.loggedIn(username: username, email: email))
            }
        }
    }
}
