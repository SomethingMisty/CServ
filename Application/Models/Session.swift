
import Foundation



class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var token: String?
    var userID: Int?
}
