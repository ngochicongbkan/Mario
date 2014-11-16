////
////  Mario.swift
////  UIViewControls
////
////  Created by Trinh Minh Cuong on 9/29/14.
////  Copyright (c) 2014 Techmaster. All rights reserved.
////
//
//import UIKit
//class Mario: UIViewController {
//    var city1 = UIImageView()
//    var city2 = UIImageView()
//    var mario = UIImageView()
//    var ong = UIImageView()
//    var timeCity = NSTimer()
//    var timeMario = [AnyObject]()
//    var timeOng = NSTimer()
//    var lbl = UILabel()
//    var v0: CGFloat = -700
//    var v1: CGFloat = -700
//    var a: CGFloat = 3400
//    var t: CGFloat = 0.0
//    var i = 0
//    var timer = NSTimer()
//    
//    var tap = UITapGestureRecognizer()
//    
//    let marioImage = [UIImage(named: "1.png"), UIImage(named: "2.png"), UIImage(named: "3.png"), UIImage(named: "4.png"), UIImage(named: "5.png"), UIImage(named: "6.png"), UIImage(named: "7.png"), UIImage(named: "8.png")]
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.mario.startAnimating()
//        
//    }
//    
//    
//    override func loadView() {
//        super.loadView()
//        self.view.backgroundColor = UIColor.whiteColor()
//        
//        self.city1.image = UIImage(named: "city1.png")
//        self.city1.bounds = CGRect(x: 0, y: 0, width: 1498, height: 400)
//        self.city1.center = CGPoint(x: 1498 / 2, y: self.view.bounds.height - 240)
//        self.view.addSubview(self.city1)
//        
//        self.city2.image = UIImage(named: "city1.png")
//        self.city2.bounds = CGRect(x: 0, y: 0, width: 1498, height: 400)
//        self.city2.center = CGPoint(x: 1498 / 2 + 1498, y: self.view.bounds.height - 240)
//        self.view.addSubview(self.city2)
//        
//        CityRun()
//        
//        self.lbl = UILabel(frame: CGRect(x: 0, y: 70, width: 200, height: 20))
//        self.lbl.backgroundColor = UIColor.blackColor()
//        self.lbl.font = UIFont(name: "TimeNewRoman", size: 14)
//        self.lbl.textColor = UIColor.whiteColor()
//        self.lbl.text = "Starting Game !"
//        self.view.addSubview(self.lbl)
//        
//        
//        self.ong.image = UIImage(named: "Ong.png")
//        self.ong.frame = CGRect(x: self.view.bounds.width - 50, y: self.view.bounds.height - 100, width: 40, height: 60)
//        
//        OngRun()
//        self.view.addSubview(self.ong)
//        
//        
//        self.mario = UIImageView(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100, width: 40, height: 60))
//        self.mario.center.y = self.view.bounds.height - 70
//        self.mario.userInteractionEnabled = true
//        self.mario.multipleTouchEnabled = true
//        self.view.addSubview(self.mario)
//        
//        MarioRun()
//        
//        Check()
//        
//        self.tap = UITapGestureRecognizer(target: self, action: "tapOnScreen")
//        self.view.addGestureRecognizer(tap)
//        
//        
//    }
//    
//    
//    func tapOnScreen() {
//        self.i += 1
//        println("tap\(i)")
//        //     var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "jumpMario:", userInfo: nil, repeats: true)
//        self.timeMario.append(NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "jumpMario:", userInfo: nil, repeats: true))
//        if self.timeMario.count == 2 {
//            self.v1 = self.v0
//            self.timeMario[0].invalidate()
//            self.timeMario.removeAtIndex(0)
//            self.i--
//            
//        }
//        
//    }
//    
//    
//    
//    func jumpMario(timer: NSTimer) {
//        self.t += 0.01
//        println("\(t)")
//        self.v1 = self.v1 + self.a * 0.01
//        // println("\(self.v1)")
//        self.mario.center.y += self.v1 * 0.01
//        //  println("x: \(self.mario.center.y)")
//        if self.mario.center.y > self.view.bounds.height - 70 {
//            self.mario.center.y = self.view.bounds.height - 70
//            self.v1 = -200
//            timer.invalidate()
//            self.i--
//            
//        }
//    }
//    func MarioRun() {
//        self.mario.animationImages = self.marioImage
//        self.mario.animationDuration = 1
//        self.mario.animationRepeatCount = -1
//    }
//    
//    func CityRun() {
//        self.timeCity = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "runCity", userInfo: nil, repeats: true)
//        print(self.timeCity.valid)
//    }
//    func OngRun() {
//        self.timeOng = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "runOng", userInfo: nil, repeats: true)
//        
//    }
//    
//    func runOng() {
//        self.ong.center.x -= 1
//        if self.ong.center.x < 0 {
//            self.ong.center.x = self.view.bounds.width
//        }
//    }
//    func runCity() {
//        self.city1.center.x -= 10
//        if self.city1.center.x < -1498/2 {
//            self.city1.center.x = 1498 / 2 + 1498
//        }
//        self.city2.center.x -= 10
//        if self.city2.center.x < -1498/2 {
//            self.city2.center.x = 1498 / 2 + 1498
//        }
//    }
//    func Check() {
//        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "checkFall", userInfo: nil, repeats: true)
//    }
//    
//    func checkFall() {
//        if checkFail(self.mario, ong: self.ong) == true {
//            self.lbl.text = "Game Over !"
//            self.timeCity.invalidate()
//            self.timeOng.invalidate()
//            for bs in self.timeMario {
//                bs.invalidate()
//            }
//        }
//    }
//    
//    func checkFail(mario: UIImageView, ong: UIImageView) -> Bool{
//        println("\(ong.center.x) and \(self.view.bounds.width / 2)")
//        if self.mario.center.y > self.view.bounds.height - 130 && self.ong.center.x > self.view.bounds.width / 2 - 40 && self.ong.center.x <  self.view.bounds.width / 2 + 40 {
//            return true
//        }
//        return false
//    }
//}
//
//
//
//
////class Mario: UIViewController {
////    var mario: UIImageView?
////    var city1, city2, city3, city4: UIImageView?
////    var _timer: NSTimer?
////    var viewHeight: Double = 0.0
////    var moveX = 20
////    let cityWidth: Double = 1498
////    let cityHeight: Double = 400
////
////    var velY: Double = -1000
////    var accY: Double = 500
////
////
////
////    override func loadView() {
////        super.loadView()
////
////        self.view.backgroundColor = UIColor.whiteColor()
////        self.edgesForExtendedLayout = UIRectEdge.None
////        let viewSize = self.view.bounds.size
////        viewHeight = Double(viewSize.height) - 60
////
////
////        city1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
////        city1!.image = UIImage(named: "city1.png")
////        self.view.addSubview(city1!)
////       /*
////        city2 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
////        city2!.image = UIImage(named: "city2.png")
////        self.view.addSubview(city2!)
////
////        city3 = UIImageView(frame: CGRect(x: cityWidth * 2, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
////        city3!.image = UIImage(named: "city3.png")
////        self.view.addSubview(city3!) */
////
////        city4 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
////        city4!.image = UIImage(named: "city1.png")
////        self.view.addSubview(city4!)
////
////
////        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 102))
////        mario?.center = CGPoint(x: viewSize.width * 0.5, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
////        //Phải cấu hình để UIImagview để xử lí tương tác đa chạm
////        mario!.userInteractionEnabled = true
////        mario!.multipleTouchEnabled = true
////        mario!.animationImages = [
////            UIImage(named: "1.png"),
////            UIImage(named: "2.png"),
////            UIImage(named: "3.png"),
////            UIImage(named: "4.png"),
////            UIImage(named: "5.png"),
////            UIImage(named: "6.png"),
////            UIImage(named: "7.png"),
////            UIImage(named: "8.png")
////        ]
////        mario!.animationDuration = 1.0
////        self.view.addSubview(mario!)
////        mario!.startAnimating()
////        //Gắn bộ xử lí đa chạm vào Mario
////        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
////        //mario!.addGestureRecognizer(tap)
////        self.view.addGestureRecognizer(tap)
////        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runCity", userInfo: nil, repeats: true)
////        self._timer?.fire()
////    }
////
////    func runCity() {
////        city1!.center = CGPoint(x: city1!.center.x - CGFloat(moveX), y: city1!.center.y)
////       /* city2!.center = CGPoint(x: city2!.center.x - CGFloat(moveX), y: city2!.center.y)
////        city3!.center = CGPoint(x: city3!.center.x - CGFloat(moveX), y: city3!.center.y) */
////        city4!.center = CGPoint(x: city4!.center.x - CGFloat(moveX), y: city4!.center.y)
////
////        if city1!.frame.origin.x + CGFloat(cityWidth) < 0 {
////            city1!.frame = CGRect(x: Double(city4!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
////            println("move 1")
////        }
////        if city4!.frame.origin.x + CGFloat(cityWidth) < 0 {
////            city4!.frame = CGRect(x: Double(city1!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
////            println("move 2")
////        }
////
////    }
////    func tapOnMario() {
////        println("tap")
////        var timer: NSTimer?
////        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "dropBall", userInfo: nil, repeats: true)
////        var y: Double = Double(self.view.bounds.size.height - 10 - mario!.bounds.size.height * 0.5)
////        var x = Double(self.view.bounds.size.width / 2)
////        var maxHeight: Double = Double(self.view.bounds.size.height - 10 - mario!.bounds.size.height * 0.5)
////        velY += accY * 0.1
////        y += velY
////
////        if y > maxHeight {
////            velY = 0
////            y = maxHeight
////
////        }
////        mario!.center = CGPoint(x: x, y: y)
////        if y == maxHeight {
////            timer?.invalidate()
////        }
////    }
////
////
////    override func viewDidDisappear(animated: Bool) {
////        super.viewDidDisappear(animated)
////        _timer?.invalidate()
////        _timer = nil
////    }
////}
