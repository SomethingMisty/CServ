
import Foundation



class Session {
    
    static let instance = Session()
    
    private init() {}
    
    let token: String = ""
    let userID: Int = 0
}
