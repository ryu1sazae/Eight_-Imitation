//
//  TopViewController.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {
    
    @IBOutlet private weak var takePhotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
    }
}

private extension TopViewController {
    @IBAction func didTapTakePhotoButton(_ sender: Any) {
        nextScreen()
    }

    func setUpScreen() {
        takePhotoButton.layer.cornerRadius = 100
        navigationItem.titleView = UIImageView(image: UIImage(named: "Sansan_logo")!)
    }

    func nextScreen() {
        let cameraViewController = CameraViewController.instantiate()
        let navigation = UINavigationController(rootViewController: cameraViewController)
        present(navigation, animated: true)
    }
}
