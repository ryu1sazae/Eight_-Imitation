//
//  ProfileElementsCreaterTests.swift
//  Sansan-Mobile-InternshipTests
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2019 Kotaro Fukuo. All rights reserved.
//
@testable import Sansan_Mobile_Internship
import XCTest

final class ProfileElementsCreaterTests: XCTestCase {
    let creater = ProfileElementsCreater()

    func testResult1() {
        let recognizedString = "INADA\nいなだ出版株式会社\n監查部部長\n“宗照\n瀬津 宗昭\nT150-5569\n東京都登町区西原99-92 いなだビル\nTEL 033-3540-9171\nFAX 033-3540-9172\nMOBILE 096-1199-7654\nE-mail inada-syuppan@inds.fd.df\nSITE http://inada-syuppan.wik\n。\n"
        let profile = creater.create(from: recognizedString)
        
        XCTAssertEqual(profile.name, "瀬津 宗昭")
        XCTAssertEqual(profile.tel, "033-3540-9171")
        XCTAssertEqual(profile.email, "inada-syuppan@inds.fd.df")
        XCTAssertEqual(profile.company, "いなだ出版株式会社")
    }

    func testResult2() {
        let recognizedString = "エンジニアリングサービスユニット\nサービス主任\n手島千枝\n〒150-0001\n東京都渋谷区神宮前5-52-2 青山オーバルビル13F\nTEL 03-6758-0033\nFAX 03-3409-3133\nMOBILE 090-1234-5678\nE-mail dummy092@sansan.co.jp\nSITE http://jp.corp-sansan.com/\nエイトバンク銀行株式会社\n"
        let profile = creater.create(from: recognizedString)
        
        XCTAssertEqual(profile.name, "手島千枝")
        XCTAssertEqual(profile.tel, "03-6758-0033")
        XCTAssertEqual(profile.email, "dummy092@sansan.co.jp")
        XCTAssertEqual(profile.company, "エイトバンク銀行株式会社")
    }

    func testResult3() {
        let recognizedString = "LEANグローバル株式会社\n營業本部\n部長補佐\n瀬長梨花\n〒150-0001 東京都渋谷区神宮前5-52-2\n青山才一代LED 13F\nTEL 03-6758-0033\nFAX 03-3409-3133\nMOBILE 090-1234-5678\nE-mail dummy129@sansan.co.jp\nSITE http://jp.corp-sansan.com/\n"
        let profile = creater.create(from: recognizedString)
        
        XCTAssertEqual(profile.name, "瀬長梨花")
        XCTAssertEqual(profile.tel, "03-6758-0033")
        XCTAssertEqual(profile.email, "dummy129@sansan.co.jp")
        XCTAssertEqual(profile.company, "LEANグローバル株式会社")
    }
}
