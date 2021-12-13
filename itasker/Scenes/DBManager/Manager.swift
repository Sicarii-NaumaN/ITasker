//
//  Manager.swift
//  itasker
//
//  Created by Yashuvaev Naum on 12.12.2021.
//

import Foundation
import UIKit

final class Manager {
    static let shared = Manager()
    
    private init() {
    }
    
    func deleteTask(_ id: String) {
        UserDefaults.standard.removeObject(forKey: id)
    }
    func getTasks(_ id: String) -> [Task] {
        var tasks = [Task]()
        
        do {
            // Достаем структуру соответсвия Юзер -> [айдишники его тасок]
            let userTasks = try UserDefaults.standard.get(objectType: UserTasks.self, forKey: id)
            if let userTasks = userTasks as? UserTasks {
                for taskID in userTasks.tasks {
                    // В цикле достаем таски по айдишнику]
                    let taskOfUser = try UserDefaults.standard.get(objectType: Task.self, forKey: taskID)
                    if var taskOfUser = taskOfUser as? Task {
                        tasks.append(taskOfUser)
                        debugPrint("[DEBUG] I am in taskOfUser \(taskID)")
                    } else {
                        debugPrint("[ERROR] Can not cast to Task")
                    }
                }
                return tasks.reversed()
            } else {
                let object = UserTasks(tasks: [], id: id)
                debugPrint("[ERROR] Can not cast to userTasks")
                updateUserInfo(object, id)
                debugPrint("[ERROR] Can not cast to userTasks")
                return tasks.reversed()
            }
            
        } catch {
            debugPrint(error)
        }
        
        return tasks.reversed()
    }
    
    func addTask(_ task: Task,_ id: String, _ isNewTask: Bool) {
        do {
            try UserDefaults.standard.set(object: task, forKey: task.id)
            let userTasks = try UserDefaults.standard.get(objectType: UserTasks.self, forKey: id)
            if isNewTask {
                if var userTasks = userTasks as? UserTasks {
                    if !userTasks.tasks.isEmpty {
                        userTasks.tasks.append(task.id)
                        
                        
                        updateUserInfo(userTasks, id)
                        
                    } else {
                        let object = UserTasks(tasks: [task.id], id: id)
                        updateUserInfo(object, id)
                    }
                }
                
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func updateUserInfo(_ userTasks: UserTasks, _ id : String) {
        do {
            try UserDefaults.standard.set(object: userTasks, forKey: id)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
}
struct UserTasks: Codable {
    var tasks: [String]
    let id: String
    
}
struct Task: Codable {
    let id : String
    let title: String
    let description: String
    let date: Date
    let taskType: String
    let deadline: Date
    
    internal init(id: String, title: String, description: String, date: Date, taskType: String, deadline: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.taskType = taskType
        self.deadline = deadline
    }
}


public extension UIColor{
    
    var codedString: String?{
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true)
            
            return data.base64EncodedString()
            
        }
        catch let error{
            print("Error converting color to coded string: \(error)")
            return nil
        }
    }
    
    
    static func color(withCodedString string: String) -> UIColor?{
        guard let data = Data(base64Encoded: string) else{
            return nil
        }
        
        return try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        
    }
}

public extension JSONDecoder {
    
    /// Decode an object, decoded from a JSON object.
    ///
    /// - Parameter data: JSON object Data
    /// - Returns: Decodable object
    public func decode<T: Decodable>(from data: Data?) -> T? {
        guard let data = data else {
            return nil
        }
        return try? self.decode(T.self, from: data)
    }
    
    /// Decode an object in background thread, decoded from a JSON object.
    ///
    /// - Parameters:
    ///   - data: JSON object Data
    ///   - onDecode: Decodable object
    public func decodeInBackground<T: Decodable>(from data: Data?, onDecode: @escaping (T?) -> Void) {
        DispatchQueue.global().async {
            let decoded: T? = self.decode(from: data)
            
            DispatchQueue.main.async {
                onDecode(decoded)
            }
        }
    }
}

// MARK: - JSONEncoder extensions

public extension JSONEncoder {
    
    /// Encodable an object
    ///
    /// - Parameter value: Encodable Object
    /// - Returns: Data encode or nil
    public func encode<T: Encodable>(from value: T?) -> Data? {
        guard let value = value else {
            return nil
        }
        return try? self.encode(value)
    }
    
    /// Encodable an object in background thread
    ///
    /// - Parameters:
    ///   - encodableObject: Encodable Object
    ///   - onEncode: Data encode or nil
    public func encodeInBackground<T: Encodable>(from encodableObject: T?, onEncode: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            let encode = self.encode(from: encodableObject)
            
            DispatchQueue.main.async {
                onEncode(encode)
            }
        }
    }
}

public extension UserDefaults {
    
    /// Set Codable object into UserDefaults
    ///
    /// - Parameters:
    ///   - object: Codable Object
    ///   - forKey: Key string
    /// - Throws: UserDefaults Error
    public func set<T: Codable>(object: T, forKey: String) throws {
        
        let jsonData = try JSONEncoder().encode(object)
        
        set(jsonData, forKey: forKey)
    }
    
    /// Get Codable object into UserDefaults
    ///
    /// - Parameters:
    ///   - object: Codable Object
    ///   - forKey: Key string
    /// - Throws: UserDefaults Error
    public func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
        
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: result)
    }
}
