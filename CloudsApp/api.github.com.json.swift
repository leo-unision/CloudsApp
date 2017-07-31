//
//  api.github.com.json.swift
//  CloudsApp
//
//  Created by Leo on 2017/7/31.
//  Copyright © 2017年 unision. All rights reserved.
//

import Foundation
import Alamofire

struct ApiGithubComJson {
    let id: Int
    let name: String
}

extension ApiGithubComJson {
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
    }
}

extension ApiGithubComJson {
    
    static func fetch() {
        request("https://api.github.com/users/octocat/repos").responseJSON {
            response in
            guard let result_value = response.result.value,
            let array = result_value as? [Any] else {
                return
            }
            
            for JSON_OBJECT in array {
                guard let dictionary = JSON_OBJECT as? [String: Any] else {
                    return
                }
                
                guard let apiGithubComJson = ApiGithubComJson(dictionary: dictionary) else {
                    return
                }
                print(apiGithubComJson)
            }
        }
        
    }
}
