import UIKit

struct Thumbnail: Codable {
    
    let path: String
    let `extension`: String

    var url: URL {
        return URL(string: path + "." + `extension`)!
    }
}
