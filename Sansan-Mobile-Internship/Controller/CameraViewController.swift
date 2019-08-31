//
//  CameraViewController.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import UIKit
import AVFoundation

final class CameraViewController: UIViewController {

    @IBOutlet private weak var previewView: UIView!

    static func instantiate() -> CameraViewController {
        return UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as! CameraViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // TODO: 課題1
        // カメラの設定やセッションの組み立てはここで行う
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        startCapture()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopCapture()
    }
}

private extension CameraViewController {
    
    @IBAction func shootButton(_ sender: Any) {
        // TODO: 課題1
        // このタイミングでカメラのシャッターを切る
    }

    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }

    func startCapture() {
        /// TODO: 課題1
        // ここでセッションをスタート
    }

    func stopCapture() {
        /// TODO: 課題1
        // ここでセッションをストップ
    }
}
