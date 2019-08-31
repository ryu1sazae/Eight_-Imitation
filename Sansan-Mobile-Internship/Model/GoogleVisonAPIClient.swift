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
    }
}

protocol GoogleVisonAPIClientProtocol {
    func send(base64String: String, completion: @escaping ((Data?, Error?) -> Void))
}
