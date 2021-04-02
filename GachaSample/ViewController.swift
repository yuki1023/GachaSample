//
//  ViewController.swift
//  GachaSample
//
//  Created by 中村拓馬 on 2020/08/11.
//  Copyright © 2020 Nakamuratakuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //初期値ぜろ
    var number : Int = 0
    @IBOutlet var gachaButton :UIButton!
    @IBOutlet var gachaImageView : UIImageView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var ayakaImageView: UIImageView!
    
    var startTimer: Timer!
    var isButtonPushed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGachButton()
        userImageView.layer.cornerRadius = userImageView.bounds.width / 10.0
        userImageView.layer.masksToBounds = true
        
        gachaImageView.layer.cornerRadius = userImageView.bounds.width / 10.0
        gachaImageView.layer.masksToBounds = true
        
        ayakaImageView.layer.cornerRadius = userImageView.bounds.width / 18.0
        ayakaImageView.layer.masksToBounds = true
        
        
        //        ボタン丸くするコード2つ
        gachaButton.layer.cornerRadius = gachaButton.bounds.height/2
        
        gachaButton.layer.masksToBounds = true
    }
    
    func configureGachButton() {
        //        resultLabel.font = UIFont.systemFont(ofSize: 90)
        gachaButton.setTitleColor(.white, for: .normal)
        //        resultLabel.textColor = .white
        if isButtonPushed {
            gachaButton.setTitle("Stop!", for: .normal)
            gachaButton.backgroundColor = .blue
        } else {
            gachaButton.setTitle("Start!", for: .normal)
            gachaButton.backgroundColor = .red
        }
    }
    
    @IBAction func gacha(){
        
        if isButtonPushed {
            //            stop
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.startTimer.invalidate()
                
                //        最初透明度0(見えない)
                self.gachaImageView.alpha = 0
                //        １秒かけて透明度１にする(１秒後にじんわりと画像が出てくる)
                UIView.animate(withDuration: 1){
                    self.gachaImageView.alpha = 1
                }
            }
        }else {
            //            start
            startTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(makeRandomInt), userInfo: nil, repeats: true)
        }
        
        isButtonPushed = !isButtonPushed
        configureGachButton()
        
        
    }
    
    
    
    @objc func makeRandomInt() {
        number = Int(arc4random_uniform(100))
        
        
        if number >= 100{
            //            named:以降は画像ファイルの名前入れてね！.pngとか.jpgみたいな拡張子も忘れずに！
            gachaImageView.image = UIImage(named:"ayaka2.JPG")
        }else if number >= 90{
            gachaImageView.image = UIImage(named: "mako.PNG")
        }else if number >= 85{
            gachaImageView.image = UIImage(named: "mako2.JPG")
        }else if number >= 80{
            gachaImageView.image = UIImage(named: "maya.PNG")
        }else if number >= 75{
            gachaImageView.image = UIImage(named: "maya2.JPG")
        }else if number >= 70{
            gachaImageView.image = UIImage(named: "mihi.PNG")
        }else if number >= 65{
            gachaImageView.image = UIImage(named: "mihi3.jpg")
        }else if number >= 60{
            gachaImageView.image = UIImage(named: "riku2.JPG")
        }else if number >= 50{
            gachaImageView.image = UIImage(named: "niziU3.PNG")
        }else if number >= 40{
            gachaImageView.image = UIImage(named: "aaa.jpg")
        }else if number >= 35{
            gachaImageView.image = UIImage(named: "aya.JPG")
        }else if number >= 30{
            gachaImageView.image = UIImage(named: "rima.PNG")
        }else if number >= 25{
            gachaImageView.image = UIImage(named: "riku.PNG")
        }else if number >= 20{
            gachaImageView.image = UIImage(named: "nina.PNG")
        }else if number >= 15{
            gachaImageView.image = UIImage(named: "usa.jpg")
        }else if number >= 10{
            gachaImageView.image = UIImage(named: "niziU4.JPG")
        }else{
            gachaImageView.image = UIImage(named: "mayuka.PNG")
        }
    }
    
}

