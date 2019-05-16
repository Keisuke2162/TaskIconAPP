//
//  MakingTask.swift
//  TaskIconAPP
//
//  Created by 植田圭祐 on 2019/05/11.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

class MakingTask: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        makeTaskView()

    }
    
    func makeTaskView() {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
        options: .curveEaseInOut, animations: {
        self.view.frame.origin.x = self.view.frame.width - 80
    
        }, completion: nil)
    }
}
