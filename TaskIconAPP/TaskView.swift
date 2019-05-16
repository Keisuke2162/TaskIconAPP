//
//  TaskView.swift
//  TaskIconAPP
//
//  Created by 植田圭祐 on 2019/05/15.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

class TaskView: UIViewController {
    
    var delegate: HomeController?
    let homeController = HomeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        
        let titleLabel = UILabel()
        titleLabel.text = "Task"
        titleLabel.textColor = .white
        titleLabel.frame = CGRect(x: 175, y: 50, width: 100, height: 20)
        print("RED")
        view.addSubview(titleLabel)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
