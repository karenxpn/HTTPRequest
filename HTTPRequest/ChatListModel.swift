//
//  ChatListModel.swift
//  HTTPRequest
//
//  Created by Karen Mirakyan on 23.03.21.
//

import Foundation
struct ChatListModel: Codable {
    var chats: [ChatModel]
}

struct ChatModel: Identifiable, Codable {
    var id: Int
    var chatName: String
    var image: String
    var message: ChatPreveiwMessage?
    var read: Bool
}

struct ChatPreveiwMessage: Codable {
    var content: String
    var created_at: String
}
