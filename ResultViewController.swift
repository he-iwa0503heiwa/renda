//
//  ResultViewController.swift
//  renda
//
//  Created by heiwa on 2015/07/30.
//  Copyright (c) 2015年 heiwa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

     var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
    
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var scoreALabel : UILabel!
    @IBOutlet var scoreBLabel : UILabel!

    
    @IBOutlet var maruA : UILabel!
    @IBOutlet var maruB : UILabel!

    
    
    
    var scoreA : Int = 0
    var scoreB : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreA = appDelegate.score1!
        scoreB = appDelegate.score2!
        
        scoreALabel.text = String(scoreA)
        scoreBLabel.text = String(scoreB)
        
        
        
        var animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSNumber(double: 0)
        animation.toValue = NSNumber(double: 2 * M_PI)
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 5
        animation.repeatCount = Float.infinity

        
        
        //判定
        if scoreA < scoreB {
            //Bの勝ち
            println("B　WIN")
            resultLabel.text = "B　WIN"
            maruA.hidden = true
            maruB.hidden = false
        }else if scoreA > scoreB {
            //Aの勝ち
            println("A　WIN")
            resultLabel.text = "A　WIN"
            maruB.hidden = true
            maruA.hidden = false
        }else{
            //同点
            println("同点")
            resultLabel.text = "同点"
        }
        
            // Do any additional setup after loading the view.
        
    

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
            }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
