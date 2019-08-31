//
//  ProfileViewController.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var resultImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var telLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    private(set) var presenter: ProfileViewPresenter!

    static func instantiate(with imageData: Data) -> ProfileViewController {
        let controller = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! ProfileViewController
        controller.loadViewIfNeeded()
        controller.configure(with: imageData)
        return controller
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension ProfileViewController {
    func configure(with imageData: Data) {
        presenter = ProfileViewPresenter(
            jsonParser: ProfileJSONParser(profileCreater: ProfileElementsCreater()),
            apiClient: GoogleVisonAPIClient()
        )
        setUpNavigationBar(from: imageData)
    }

    func setUpNavigationBar(from imageData: Data) {
        let image = UIImage(data: imageData)?.rotatedToUp
        resultImageView.image = image
        navigationItem.title = "簡易プロフィール画面"
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

// TODO: 課題3 フェーズ4
// 課題3 フェーズ1で定義したPresenterのインタフェースを実装し、画面に結果を表示する

private extension UIImage {
    /// 画像を90度回転させる
    var rotatedToUp: UIImage {
        let rotated = UIImage(cgImage: cgImage!, scale: 1.0, orientation: .up)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        rotated.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rotatedImage!
    }
}
