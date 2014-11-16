//
//  ViewController.swift
//  Mario
//
//  Created by ios25 on 11/16/14.
//  Copyright (c) 2014 ios25. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var city1 = UIImageView()
    var city2 = UIImageView()
    var timeCity = NSTimer()
    
    var mario = UIImageView()
    var marioImage: NSMutableArray = []
    var tap = UITapGestureRecognizer()
    var v1: CGFloat = -350
    var a: CGFloat = 600
    var timer = NSTimer()
    
    var timerOng = NSTimer()
    var ong = UIImageView()
    
    var buttonPlay = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.city1.image = UIImage(named: "city1.png")
        self.city1.bounds = CGRect(x: 0, y: 0, width: 1498, height: 400)
        self.city1.center = CGPoint(x: 1498 / 2, y: self.view.bounds.height - 240)
        self.view.addSubview(self.city1)
        
        self.city2.image = UIImage(named: "city1.png")
        self.city2.bounds = CGRect(x: 0, y: 0, width: 1498, height: 400)
        self.city2.center = CGPoint(x: 1498 / 2 + 1498, y: self.view.bounds.height - 240)
        self.view.addSubview(self.city2)
        
        CityRun()
        self.mario = UIImageView(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100, width: 40, height: 60))
        self.mario.center.y = self.view.bounds.height - 70
        self.mario.userInteractionEnabled = true
        self.mario.multipleTouchEnabled = true
        //self.mario.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.mario)
        
        
        
        marioImage .addObject(UIImage(named: "1.png")!)
        marioImage .addObject(UIImage(named: "2.png")!)
        marioImage .addObject(UIImage(named: "3.png")!)
        marioImage .addObject(UIImage(named: "4.png")!)
        marioImage .addObject(UIImage(named: "5.png")!)
        marioImage .addObject(UIImage(named: "6.png")!)
        marioImage .addObject(UIImage(named: "7.png")!)
        
        MarioRun()
        self.mario.startAnimating()
        
        self.tap = UITapGestureRecognizer(target: self, action: "tapOnScreen")
        self.view.addGestureRecognizer(tap)
        
        self.ong.image = UIImage(named: "box.png")
        self.ong.frame = CGRect(x: self.view.bounds.width - 50, y: self.view.bounds.height - 80, width: 40, height: 40)
        
        OngRun()
        self.view.addSubview(self.ong)
        Check()
        
        buttonPlay.frame = CGRect(x: self.view.bounds.width / 2, y: 100, width: 80, height: 40)
        buttonPlay.backgroundColor = UIColor.blackColor()
        buttonPlay.setTitle("PlayAgain", forState: UIControlState.Normal)
        buttonPlay.setTitle("PlayAgain", forState: UIControlState.Highlighted)
        self.view.addSubview(buttonPlay)
        buttonPlay.addTarget(self, action: "PlayAgain", forControlEvents: UIControlEvents.TouchUpInside)
    
    }
        func CityRun() {
                self.timeCity = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "runCity", userInfo: nil, repeats: true)
                print(self.timeCity.valid)
        }
        func runCity() {
            self.city1.center.x -= 5
            if self.city1.center.x < -1498/2 {
                self.city1.center.x = 1498 / 2 + 1498
            }
            self.city2.center.x -= 5
            if self.city2.center.x < -1498/2 {
                self.city2.center.x = 1498 / 2 + 1498
            }
        }

        func MarioRun() {
            self.mario.animationImages = self.marioImage
            self.mario.animationDuration = 1
            self.mario.animationRepeatCount = -1
        }
    
    func tapOnScreen() {
        if timer.valid == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "jumpMario:", userInfo: nil, repeats: true)
        }
        
    }
    func jumpMario(timer: NSTimer) {
        self.v1 = self.v1 + self.a * 0.01
                // println("\(self.v1)")
        self.mario.center.y += self.v1 * 0.01
                //  println("x: \(self.mario.center.y)")
        if self.mario.center.y > self.view.bounds.height - 70 {
            self.mario.center.y = self.view.bounds.height - 70
            self.v1 = -350
            timer.invalidate()
                    
        }
    }
    
    func OngRun() {
        self.timerOng = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "runOng", userInfo: nil, repeats: true)
    
    }
    
    func runOng() {
        self.ong.center.x -= 1
        if self.ong.center.x < 0 {
            self.ong.center.x = self.view.bounds.width
        }
    }
    func Check() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "checkFall", userInfo: nil, repeats: true)
    }
    
    func checkFall() {
        if checkFail(self.mario, ong: self.ong) == true {
            self.timeCity.invalidate()
            self.timerOng.invalidate()
            self.timer.invalidate()
            self.mario.stopAnimating()
            self.mario.image = UIImage(named: "7.png")
            
        }
    }
    
    func checkFail(mario: UIImageView, ong: UIImageView) -> Bool{
        println("\(ong.center.x) and \(self.view.bounds.width / 2)")
        if self.mario.center.y > self.view.bounds.height - 110 && self.ong.center.x > self.view.bounds.width / 2 - 20 && self.ong.center.x <  self.view.bounds.width / 2 + 60 {
            return true
        }
        return false
    }
    func PlayAgain() {
        
        self.timeCity.invalidate()
        self.timerOng.invalidate()
        self.timer.invalidate()
        self.mario.stopAnimating()
        self.mario.image = UIImage(named: "7.png")
        self.mario.startAnimating()
//        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "jumpMario:", userInfo: nil, repeats: true)
      mario.frame.origin = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100)
        self.v1 = -350
        self.timeCity = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "runCity", userInfo: nil, repeats: true)
        self.ong.center.x = self.view.bounds.width
        self.timerOng = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "runOng", userInfo: nil, repeats: true)
        
        
        
    }
}

