//
//  ProfileElementsCreater.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import Foundation
typealias RegexPattern = String

enum TargetType: RegexPattern {
    case company = "株式会社"
    case name   = "^\\p{Han}{1,3}\\s?\\p{Han}{1,3}$"
    case tel    = "TEL\\s?(\\d{2,3}-\\d{4}-\\d{4})"
    case email  = "E-?mail\\s?([\\d\\.a-z\\-]+@[\\d\\.a-z]+)"
}

struct ProfileElementsCreater {
    func create(from recognizedString: String) -> Profile {
        let texts = recognizedString.components(separatedBy: "\n")

        var name: String?
        var email: String?
        var tel: String?
        var company: String?

        texts.forEach {
            let companyRegex = try! NSRegularExpression(pattern: TargetType.company.rawValue)
            if let _ = companyRegex.firstMatch(in: $0, range: NSRange(location: 0, length: $0.count)) {
                company = $0
            }

            let nameRegex = try! NSRegularExpression(pattern: TargetType.name.rawValue)
            if let result = nameRegex.firstMatch(in: $0, range: NSRange(location: 0, length: $0.count)) {
                name = ($0 as NSString).substring(with: result.range(at: 0))
            }

            let telRegex = try! NSRegularExpression(pattern: TargetType.tel.rawValue)
            if let result = telRegex.firstMatch(in: $0, range: NSRange(location: 0, length: $0.count)) {
                tel = ($0 as NSString).substring(with: result.range(at: 1))
            }

            let emailRegex = try! NSRegularExpression(pattern: TargetType.email.rawValue)
            if let result = emailRegex.firstMatch(in: $0, range: NSRange(location: 0, length: $0.count)) {
                email = ($0 as NSString).substring(with: result.range(at: 1))
            }
        }
        return Profile(
            name: name,
            email: email,
            tel: tel,
            company: company
        )
    }
}
