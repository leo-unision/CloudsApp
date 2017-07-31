//
//  httpbin.org.json.swift
//  CloudsApp
//
//  Created by Leo on 2017/7/31.
//  Copyright © 2017年 unision. All rights reserved.
//

import Foundation

//宣告 struct 及使用名稱，定義用來存放 JSON 內容的變數
struct HttpbinOrgJson
{
    let origin: String
    let url: String
}

extension HttpbinOrgJson
{
    init() {
        self.origin = "內部設定初始值"
        self.url = "內部設定初始值"
    }
}
