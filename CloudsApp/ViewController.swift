//
//  ViewController.swift
//  CloudsApp
//
//  Created by Leo on 2017/7/24.
//  Copyright © 2017年 unision. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://httpbin.org/get").responseJSON
        {
            response in
//            print(response.request as Any)
//            print(response.response as Any)
//            print(response.data as Any)
//            print(response.result)
            
//            if let ARRAY = response.result.value
//            {
//                print("準備印出 result 中的資料")
//                print(ARRAY)
//            }
            
            if let JSON = response.result.value
            {
                if let dictionary = JSON as? [String:Any]
                {
                    if let value = dictionary["origin"] as? String
                    {
                        print("解出 key 為 origin 的值")
                        print(value)
                    }
                    
                    if let value = dictionary["url"] as? String
                    {
                        print("解出 key 為 url 的值")
                        print(value)
                    }
                    
                    if let headers_dictionary = dictionary["headers"] as? [String:Any]
                    {
//                        if let value = headers_dictionary["Accept"] as? String
//                        {
//                            print("解出 key 為 Accept 的值")
//                            print(value)
//                        }
                        
                        for (key, value) in headers_dictionary
                        {
                            if let value_string = value as? String
                            {
                                print(key + ":" + value_string)
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

