//
//  NetworkError.swift
//  HTTPRequest
//
//  Created by Karen Mirakyan on 23.03.21.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
