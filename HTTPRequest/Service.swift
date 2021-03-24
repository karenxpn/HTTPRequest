//
//  Service.swift
//  HTTPRequest
//
//  Created by Karen Mirakyan on 23.03.21.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func fetchChats() -> AnyPublisher<DataResponse<ChatListModel, NetworkError>, Never>
}


class Service {
    static let shared: ServiceProtocol = Service()
    private init() { }
}

extension Service: ServiceProtocol {
    func fetchChats() -> AnyPublisher<DataResponse<ChatListModel, NetworkError>, Never> {
        let url = URL(string: "Your_URL")!
        
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: ChatListModel.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
