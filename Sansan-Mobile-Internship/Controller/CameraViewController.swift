//
//  CameraViewController.swift
//  Sansan-Mobile-Internship
//
//  Created by Fukuo Kotaro on 2019/07/12.
//  Copyright © 2018 Kotaro Fukuo. All rights reserved.
//

import UIKit
import AVFoundation


final class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet private weak var previewView: UIView!
    var captureSession = AVCaptureSession()
    var cameraDevices: AVCaptureDevice!
    //デバイス一覧の取得
//    let devices = AVCaptureDevice.devices()
//

    //画像のアウトプット
    var imageOutput = AVCapturePhotoOutput()

    static func instantiate() -> CameraViewController {
        return UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as! CameraViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        settingSession()
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
        print("課題1でシャッター押してるで!!")
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        // カメラの手ぶれ補正
        settings.isAutoStillImageStabilizationEnabled = true
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)

        //スクショの処理を記述
        imageOutput.capturePhoto(with: settings, delegate: self)
        
    }

    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }

    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let imageData = photo.fileDataRepresentation()
        //プロフィール画面への遷移
        let resultViewController = ProfileViewController.instantiate(with: imageData! )
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.pushViewController(resultViewController, animated:
            true)
    }
    
    func settingSession()
    {
        // TODO: 課題1
        // カメラの設定やセッションの組み立てはここで行う
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        // プロパティの条件を満たしたカメラデバイスの取得
        let devices = deviceDiscoverySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                cameraDevices = device
            }
        }
        //バックカメラからVideoInputを取得
        let videoInput: AVCaptureInput!
        do {
            videoInput = try AVCaptureDeviceInput.init(device: cameraDevices)
        } catch {
            videoInput = nil
        }
        
        //出力先を生成
        imageOutput = AVCapturePhotoOutput()
        //セッションに追加
        captureSession.addInput(videoInput)
        captureSession.addOutput(imageOutput)
        //画像を表示するレイヤーを生成
        let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        captureVideoLayer.frame = self.view.bounds
        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        //Viewに追加
        self.view.layer.insertSublayer(captureVideoLayer, at: 1)
    }
    
    func startCapture() {
        /// TODO: 課題1
        //カメラ起動(セッションをスタート)
        captureSession.startRunning()
    }

    func stopCapture() {
        /// TODO: 課題1
        //カメラとじる
        // ここでセッションをストップ
        captureSession.stopRunning()
    }
}
