//
//  DataController.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 26.07.2022.
//

import Foundation
import CoreData
import SwiftUI


class DataController: ObservableObject {
    
    // подготавливаем данные из Cached к загрузке
    let container = NSPersistentContainer(name: "Users")
    
    // загружаем постоянное хранилище(loadPersistentStores) и обрабатываем ошибку при невозможности этого сделать
    init() {
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
            }
            // обновление(объединение) повторяющихся объектов
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
