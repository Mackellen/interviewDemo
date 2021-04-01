//
//  RealmManager.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/25.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Foundation


class CacheManager: NSObject {
    
    static let share = CacheManager()
    
    func createPath(fileName:String) -> String{
        let fileManager = FileManager.default
        let localPath  = NSHomeDirectory()+"/Documents/\(fileName)"
        if !self.isExistedWithPath(filePath: localPath) {
            fileManager.createFile(atPath: localPath, contents: nil, attributes: nil)
        }
        return localPath
    }
    
     func isExistedWithPath(filePath: String) -> Bool {
        let fileManager = FileManager.default
        let isExisted = fileManager.fileExists(atPath: filePath)
        return isExisted
    }
    
    func saveData(data: NSArray, path: String) -> Bool {
        if data.isKind(of: NSArray.self), data.count > 0 {
            return data.write(toFile: path, atomically: true)
        }else{
            print("save data is Faild")
        }
        return false
    }
    
    func deleteData(path: String)  {
        let fileManager = FileManager.default
        try! fileManager.removeItem(atPath: path)
    }
    
    func getDataWithPath(path: String) -> Array<Dictionary<String,Any>>{
        let array:NSArray = NSArray(contentsOfFile: path) ?? []
        if array.isKind(of: NSArray.self), array.count > 0 {
            return array as! [[String: Any]]
        }
        return Array<[String: Any]>()
    }
    
    
}
