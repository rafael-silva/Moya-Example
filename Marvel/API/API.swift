import Foundation
import Moya

public enum API {
    static private let publicKey = "24333dfd9610c8eddac571a1fb5e66eb"
    static private let privateKey = "99e85f4d60b0c7dfd5d7bb0e4e21d4be38a546d8"
    
    case characters
}

extension API: TargetType {
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
    }
    
    public var path: String {
        switch self {
        case .characters: return "/characters"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .characters: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        let ts = NSDate().timeIntervalSince1970.description
        let hash = (ts + API.privateKey + API.publicKey).md5
        
        switch self {
        case .characters:
            return .requestParameters(
                parameters:[
                    "ts": ts,
                    "apikey": API.publicKey,
                    "hash": hash], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}


