//
//  ViewSwiftController.swift
//  UIProject
//
//  Created by Knight on 2018/8/22.
//  Copyright © 2018年 林晓峰. All rights reserved.
//

import UIKit

class ViewSwiftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.red;
        // Do any additional setup after loading the view.
        self.createUI()
    }
    
    func createUI()->Void {
        createButton()
    }
    
    func createButton() -> Void {
        let btn = UIButton()
        btn.frame = CGRect(x: 200, y: 100, width: 100, height: 40)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: Selector("expressBtn"), for: UIControlEvents.touchDown)
        self.view.addSubview(btn)
    }
    
    func expressBtn() -> Void {
        NSLog("alert")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
