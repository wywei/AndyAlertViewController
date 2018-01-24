//
//  ViewController.swift
//  AYAlertController
//
//  Created by Andy on 2018/1/24.
//  Copyright © 2018年 wangyawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func didClickedDeleteBtn(_ sender: UIButton) {
        //  1、连贯，语意集中，增强代码可读性。
        //  2、代码简洁
        
       
        AYAlertController.Builder(controller: self).title("温馨提示").message("你真的想删除美女么？").confirmHandler { (action) in
            //  TODO:
            }.confirmTitle("确定").cancelHandler { (action) in
                //  TODO:
            }.cancelTitle("取消").build().show()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

