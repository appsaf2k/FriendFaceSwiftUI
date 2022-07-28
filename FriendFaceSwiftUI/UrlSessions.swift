//
//  UsersViewModel.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 24.07.2022.
//
//
import Foundation
import CoreData
import SwiftUI


@MainActor // убирает ошибку "Reference to captured var 'self'..."
class UrlSessions: ObservableObject {
    // сюда копируем загруженный json
    @Published var users: [User] = []
    
    func fetchUser() async {
        
        let usersUrl = "https://www.hackingwithswift.com/samples/friendface.json"
        if let url = URL(string: usersUrl) {
            
             URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                
                DispatchQueue.main.async {
                    
                    if let error = error {
                        
                        print(error.localizedDescription)
                        
                    } else {
                        
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase

                        if let data = data,
                           let users = try? decoder.decode([User].self, from: data) {
                            self?.users = users
                        }
                    }
                }
            }.resume()
        }
    }
}
