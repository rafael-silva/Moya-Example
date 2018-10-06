import Foundation
import Moya

private protocol ServiceDataSource: class {
    static func fetchComics(completion: @escaping ([Character]?, String?) -> Void)
}

public class Service: ServiceDataSource {
    let provider = MoyaProvider<API>()
    
    static func fetchComics(completion: @escaping ([Character]?, String?) -> Void) {
        _ = MoyaProvider<API>().request(.characters) { output in
            switch output {
            case let .success(response):
                do {
                     completion((try response.map(APIResponse<Character>.self).data.results), nil)
                } catch (let error) {
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error): completion(nil, error.localizedDescription)
            }
        }
    }
}
