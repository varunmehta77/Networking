//
//  Networking.swift
//
//
//  Created by Varun Mehta on 07/06/21.
//

import Foundation
import UIKit

public class Networking {
    
    public func performNetworkRequest(url: String, completion: @escaping (Any?, String?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            completion(data, error?.localizedDescription)
        }
    }
}
