//
//  GoogleVisonAPIClient.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import Foundation

struct GoogleVisonAPIClient: GoogleVisonAPIClientProtocol {

    func send(base64String: String, completion: @escaping ((Data?, Error?) -> Void)) {
        // TODO: 課題2
        // ここでCloud Vision APIのリクエストを組み立て
        // URLSessionを使って通信をする
        // 通信が終わったらcompletionを呼ぶこと
//        let config: URLSessionConfiguration = URLSessionConfiguration.default
//        let session: URLSession = URLSession(configuration: config)
        let googleApyKey = "AIzaSyB-Au2mPg_UuYVdZANny8VbiD_mqVaHEyY"
        guard let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleApyKey)") else { return }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //bodyの作成
        let params = [
            "requests": [
                [
                    "image": [
                        "content":base64String
                    ],
                    "features": [
                        [
                            "type": "DOCUMENT_TEXT_DETECTION"
                        ]
                    ]
                ]
            ]
        ]
        
        do{
            req.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: {(data,response,error) -> Void in
                let resultData = String(data: data!, encoding: .utf8)!
                print("error:\(String(describing: error))")
                print("result:\(resultData)")
                print("response:\(String(describing: response))")
            })
            task.resume()
        }catch{
            print("Error:\(error)")
            return
        }

    }
}

protocol GoogleVisonAPIClientProtocol {
    func send(base64String: String, completion: @escaping ((Data?, Error?) -> Void))
}
