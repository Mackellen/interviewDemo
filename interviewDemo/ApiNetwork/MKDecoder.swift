//
//  MKDecoder.swift
//  SpeechDemo
//
//  Created by Mackellen on 2020/10/15.
//

import Foundation

enum MKError: Error {
    case message(String)
}

struct MKDecoder {

    public static func decode<T>(_ type: T.Type, param: [String: Any]) throws -> T? where T: Decodable {
        if param.isEmpty {
            return nil
        }
        guard let jsonData = self.getJsonData(with: param) else {
            throw MKError.message("转换jsonData失败")
        }
        guard let model = try? JSONDecoder().decode(T.self, from: jsonData) else {
            throw MKError.message("转换模型失败")
        }
        return model
    }
    public static func decode<T>(_ type: T.Type, array: [[String: Any]]) -> [T]? where T: Decodable {
        if let jsonData = self.getJsonData(with: array) {
            if let models = try? JSONDecoder().decode([T].self, from: jsonData) {
                return models
            }
        } else {
            print("模型转换jsonData失败")
        }
        return nil
    }
    private static func getJsonData(with param: Any) -> Data? {
        if !JSONSerialization.isValidJSONObject(param) {
            return nil
        }
        guard let data = try? JSONSerialization.data(withJSONObject: param, options: []) else {
            return nil
        }
//        //Data转换成String打印输出
//        let str = String(data:data, encoding: String.Encoding.utf8)
//        //输出json字符串
//        print("Json Str:\(str!)")
        return data
    }
}

struct MKEncoder {
    public static func encoder<T>(toString model: T) throws -> String? where T: Encodable {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(model) else {
            throw MKError.message("转换data失败")
        }
        guard let jsonStr = String(data: data, encoding: .utf8) else {
            throw MKError.message("转换json失败")
        }
        return jsonStr
    }
    public static func encoder<T>(toDictionary model: T) throws -> [String: Any]? where T: Encodable {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(model) else {
            throw MKError.message("转换data失败")
        }
        guard let diction = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as?
                [String: Any] else {
            throw MKError.message("转换dictionary失败")
        }
        return diction
    }
}
