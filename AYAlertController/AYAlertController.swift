//
//  AYAlertController.swift
//
//  Created by Andy on 2017/12/22.
//  Copyright © 2017年 Tz. All rights reserved.
//  自定义UIAlertController

import UIKit

//  构建者模式优点：
//  1、使用建造者模式可以使客户端不必知道产品内部组成的细节。
//  2、具体的建造者类之间是相互独立的，这有利于系统的扩展。
//  3、具体的建造者相互独立，因此可以对建造的过程逐步细化，而不会对其他模块产生任何影响。

//类似于提示框
class AYAlertController: NSObject {
    
    private var builder:Builder
    
    private init(builder:Builder) {
        self.builder = builder
        super.init()
    }
    
    func show() {
        let alert = UIAlertController(title: self.builder.params.title, message: self.builder.params.message, preferredStyle: UIAlertControllerStyle.alert)
        //是否添加按钮
        //取消按钮
        if self.builder.params.cancelTitle != nil {
            alert.addAction(UIAlertAction(title: self.builder.params.cancelTitle, style: UIAlertActionStyle.destructive, handler: self.builder.params.cancelHandler))
        }
        //确定按钮
        if self.builder.params.confirmTitle != nil {
            alert.addAction(UIAlertAction(title: self.builder.params.confirmTitle, style: UIAlertActionStyle.destructive, handler: self.builder.params.confirmHandler))
        }
        
        //显示
        self.builder.params.controller?.present(alert, animated: true, completion: nil)
    }

    //准备UI参数类
    class AlertParams: NSObject {
        var controller:UIViewController?
        var title:String?
        var message:String?
        var confirmTitle:String?
        var confirmHandler:((UIAlertAction)->Swift.Void)?
        var cancelTitle:String?
        var cancelHandler:((UIAlertAction)->Swift.Void)?
        
        init(_ controller:UIViewController) {
            super.init()
            self.controller = controller;
        }
    }
    
    //构建者
    class Builder: NSObject {
        var params:AlertParams
        init(controller:UIViewController) {
            self.params = AlertParams(controller)
            super.init()
        }
        
        func title(_ title:String) -> Builder {
            self.params.title = title
            return self
        }
        
        func message(_ message:String) -> Builder {
            self.params.message = message
            return self
        }
        
        func confirmTitle(_ confirmTitle:String) -> Builder {
            self.params.confirmTitle = confirmTitle
            return self
        }
        
        func confirmHandler(_ confirmHandler:@escaping ((UIAlertAction)->Swift.Void)) -> Builder {
            self.params.confirmHandler = confirmHandler
            return self
        }
        
        func cancelTitle(_ cancelTitle:String) -> Builder {
            self.params.cancelTitle = cancelTitle
            return self
        }
        
        func cancelHandler(_ cancelHandler:@escaping ((UIAlertAction)->Swift.Void)) -> Builder {
            self.params.cancelHandler = cancelHandler
            return self
        }
        
        func build() -> AYAlertController {
            return AYAlertController(builder: self)
        }
        
    }
    
}
