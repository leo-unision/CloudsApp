import UIKit
import Alamofire

class ViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://api.github.com/users/octocat/repos").responseJSON
            { response in
            
            //更符合內容的命名變數名稱為 result_value
            guard let result_value = response.result.value,
            let array = result_value as? [Any]
            else
            {
                return
            }
            
            for JSON_OBJECT in array
            {
                guard let dictionary = JSON_OBJECT as? [String: Any]
                else
                {
                    return
                }
                
                for (key, value) in dictionary
                {
                    switch value
                    {
                    case is Int:
                        print("\(key):\(value)(Int)")
                    case is String:
                        print("\(key):\(value)(String)")
                    case is Bool:
                        print("\(key):\(value)(Bool)")
                    default:
                        print("\(key):(unknown type)")
                    }
                }
                
//                    if let value = dictionary["id"] as? Int {
//                        print("id: \(value)")
//                    }
//                    
//                    if let value = dictionary["name"] as? String {
//                        print("name: \(value)")
//                    }
//                    
//                    if let value = dictionary["private"] as? Bool {
//                        print("private: \(value)")
//                    }
//                    
//                    if let value = dictionary["homepage"] as? String {
//                        print("homepage: \(value)")
//                    } else {
//                        print("homepage: null")//不知道原始格式之下的處理
//                    }
                }
            }
        
        Alamofire.request("https://httpbin.org/get").responseJSON
        { response in
            
            guard let JSON_OBJECT = response.result.value,
                let dictionary = JSON_OBJECT as? [String: Any]
                else {
                    return
            }
                    
            guard let origin = dictionary["origin"] as? String else {
                        return
            }
                
            print("origin: \(origin)")
                
            guard let url = dictionary["url"] as? String else {
                return
            }
                
            print("url: \(url)")
            
            let httpbinOrgJson = HttpbinOrgJson(origin: origin, url: url)
            print(httpbinOrgJson)
            
            let httpbinOrgJson2 = HttpbinOrgJson()
            print(httpbinOrgJson2)
        }
    }
    
            
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

