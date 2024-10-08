import Foundation

public enum IChatRoomWebSocket {
    public enum Response {
        case loggedIn(username: String, email: String)
    }
}
