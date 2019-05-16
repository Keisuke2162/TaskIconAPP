//
//  HomeController.swift
//  TaskIconAPP
//
//  Created by 植田圭祐 on 2019/05/11.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

var viewStatus = "Home"

class HomeController: UIViewController {
    
    //アイコンに登録するタスク情報
    struct iconData {
        var x: CGFloat
        var y: CGFloat
        let iconName: String
        var taskTitle: String
        var taskMessage: String
        var colorCode: String
        var iconImage: String
    }
    
    var centerController: UIViewController!
    var taskViewFlag = false
   // var delegate: HomeController?
    
    //タスク情報の配列
    var iconDataList = [iconData]()
    //画面タップ時の座標格納変数
    var tapLocation = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("didload")
        view.backgroundColor = .white
        
        ViewLoad()
        
    }
    
    //画面上をタップした時の処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let touch = touches.first
        tapLocation = touch!.location(in: self.view)
        
        if viewStatus == "Home" {
            makeButton(location: tapLocation)
        }
    }
    
    func makeButton(location: CGPoint) {
        
        let x = location.x
        let y = location.y
        
        let taskButton = UIButton()
        taskButton.backgroundColor = .blue
        taskButton.layer.cornerRadius = 10.0
        taskButton.frame = CGRect(x: taskButton.center.x, y: taskButton.center.y, width: 40, height: 40)
        taskButton.center = CGPoint(x: x, y: y)
        taskButton.addTarget(self, action: #selector(configureTaskView), for: .touchUpInside)
        
        view.addSubview(taskButton)
    }
    
    //下の方からViewをアニメーションしながら表示or非表示
    @objc func configureTaskView() {
        
        if taskViewFlag {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
                           options: .curveEaseInOut, animations: {
                            self.centerController.view.frame.origin.y = self.centerController.view.frame.height
            }, completion: nil)
            taskViewFlag = false
            viewStatus = "Home"
            
        } else {
            print("ViewScreen")
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
                           options: .curveEaseInOut, animations: {
                            self.centerController.view.frame.origin.y = self.centerController.view.frame.height - 300
            }, completion: nil)
            viewStatus = "ViewTask"
            taskViewFlag = true
        }
        
        view.addSubview(centerController.view)
        //addChild(centerController)
        //centerController.didMove(toParent: self)
    }
    
    func ViewLoad() {
        //TaskViewをインスタンス化してNavigationControllerに登録
        let taskViewController = TaskView()
        taskViewController.delegate = self
        
        centerController = UINavigationController(rootViewController: taskViewController)
        
        //TaskViewの初期値を画面下に配置
        self.centerController.view.frame.origin.y = self.centerController.view.frame.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
