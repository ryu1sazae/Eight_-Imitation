//
//  ProfileJSONParser.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2019 Kotaro Fukuo. All rights reserved.
//

import Foundation

struct ProfileJSONParser: ProfileJSONParserProtocol {
    private let profileCreater: ProfileElementsCreater

    init(profileCreater: ProfileElementsCreater) {
        self.profileCreater = profileCreater
    }

    func parse(data: Data) -> Profile? {
        let decoder = JSONDecoder()
        guard let imageResponse = try? decoder.decode(ImagesResponse.self, from: data),
        let recognizedString = imageResponse.responses.first?.textAnnotations?.first?.description else {
            return nil
        }
        return profileCreater.create(from: recognizedString)
    }
}

protocol ProfileJSONParserProtocol {
    func parse(data: Data) -> Profile?
}
