//
//  ViewController.swift
//  renda
//
//  Created by heiwa on 2015/07/30.
//  Copyright (c) 2015年 heiwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
    
    var number: Int = 0
    
    
    
    @IBOutlet var label: UILabel!
    
    var number2: Int = 0
    
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    
    
    var count: Float = 10.0
    var timer: NSTimer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func plus() {
        if timer.valid {
            if count >= 0.00 {
                number = number + 1
                label.text = String(number)
            }
        }
    }
    
    @IBAction func p() {
        if timer.valid {
            if count >= 0.00 {
                number2 = number2 + 1
                label2.text = String(number2)
            }
        }
    }
    
    @IBAction func start(){
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func up() {
        timeLabel.text = String(format:"%.2f" , count)
        if count < 0.00{
            timer.invalidate()
            timeLabel.text = String("0.00")
            appDelegate.score1 = number
            appDelegate.score2 = number2
            let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier("result") as UIViewController
            self.presentViewController( targetViewController, animated: true, completion: nil)
        /*初めてプレイしたときの勝った方のスコアをベストスコアとして保存
        それ以降は勝った方とベストスコアを比べて、ベストスコアの方が大きかったらそのままで、勝った方が大きかったら
            */
        }
        count = count - 0.01
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

