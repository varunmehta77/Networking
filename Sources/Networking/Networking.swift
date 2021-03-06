//
//  Networking.swift
//
//
//  Created by Varun Mehta on 07/06/21.
//

import Foundation
import UIKit

public enum NetworkingHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class Networking {

    public func performNetworkRequest(url: String, method: NetworkingHTTPMethod, params: [String: Any]?, headers: [String: String]?, completion: @escaping (Any?, String?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let params = params, params.count > 0, let body = try? JSONSerialization.data(withJSONObject: params, options: [])
        {
            request.httpBody = body
        }
        if let headers = headers, headers.count > 0 {
            var allheaders = [String: String]()
            for header in headers {
                allheaders[header.key] = header.value
            }
        }
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            completion(data, error?.localizedDescription)
        }
    }
}
