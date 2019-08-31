//
//  ProfilePresenterTests.swift
//  Sansan-Mobile-InternshipTests
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2019 Kotaro Fukuo. All rights reserved.
//
@testable import Sansan_Mobile_Internship
import XCTest

final class ProfilePresenterTests: XCTestCase {

    func testプロフィールのロードをしなければプロフィールのロードがされないこと() {
    }

    func testAPIとパースが成功した場合プロフィールのロードが成功していること() {
    }

    func testAPI通信が失敗した場合はネットワークエラーになること() {
    }

    func testAPI通信は成功したがJSONのパースに失敗した場合は認識エラーになること() {
    }
}

private extension ProfilePresenterTests {

    final class StubSuccessProfileJSONParser: ProfileJSONParserProtocol {
        func parse(data: Data) -> Profile? {
            return Profile(
                name: "テスト",
                email: "dummy@sansan.com",
                tel: "03-3333-3333",
                company: "Sansan株式会社"
            )
        }
    }

    final class StubFailureProfileJSONParser: ProfileJSONParserProtocol {
        func parse(data: Data) -> Profile? {
            return nil
        }
    }

    final class StubSuccessAPIClient: GoogleVisonAPIClientProtocol {
        func send(base64String: String, completion: @escaping ((Data?, Error?) -> Void)) {
            completion(Data(capacity: 1), nil)
        }
    }

    final class StubFailureAPIClient: GoogleVisonAPIClientProtocol {
        enum NetworkError: Error {
            case downServer
        }

        func send(base64String: String, completion: @escaping ((Data?, Error?) -> Void)) {
            completion(nil, NetworkError.downServer)
        }
    }
}
