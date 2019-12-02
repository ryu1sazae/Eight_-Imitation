//
//  ResultViewPresenter.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import Foundation

// TODO: 課題3 フェーズ1

//
func Success() {
    //
}

func Fail() {
    //
}

func FailToRecogniza(){
    //
}

final class ProfileViewPresenter {
    private let jsonParser: ProfileJSONParserProtocol
    private let apiClient: GoogleVisonAPIClientProtocol
    private let profile: ProfileViewPresenter
    
    init(jsonParser: ProfileJSONParserProtocol,
         apiClient: GoogleVisonAPIClientProtocol) {
        self.jsonParser = jsonParser
        self.apiClient = apiClient
        // TODO: 課題3 フェーズ2
        // イニシャライザでViewを受け取る
        self.profile = ProfileViewPresenter.init(jsonParser: self.jsonParser, apiClient: self.apiClient)
    }

    func loadProfile(from base64String: String) {
        apiClient.send(base64String: base64String) { (data, error) in
            // TODO: 課題3 フェーズ3
            // jsonParserを利用してOCR結果をパースし、Viewに伝える
//            var profileCreater = profile.
//
//            profile = ProfileJSONParser(profileCreater: )
        }
    }
}
