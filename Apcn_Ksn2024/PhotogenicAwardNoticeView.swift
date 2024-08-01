//이벤트 페이지 join the event
//  PhotojenicAwardNoticeView.swift
//  korl2019f
//
//  Created by JinGu's iMac on 10/10/2019.
//  Copyright © 2019 JinGu's iMac. All rights reserved.
//

import UIKit
import WebKit

class PhotogenicAwardNoticeView: UIView {
    
    var webView : WebView!
    
    init(listVC : PhotoListViewController) {
        super.init(frame: SCREEN.BOUND)
        
        let bgImageView = UIImageView(frame: self.bounds)
        if IS_NORCH {
            bgImageView.image = UIImage(named: "Photogenic_Max")
//            bgImageView.setImageWithFrameHeight(image: UIImage(named: "Photogenic_Max"))
        }else{
            bgImageView.image = UIImage(named: "Photogenic_Plus")
//            bgImageView.setImageWithFrameHeight(image: UIImage(named: "Photogenic_Plus"))
        }
        self.addSubview(bgImageView)
        
        let closeButtonSize : CGFloat = SCREEN.WIDTH * 0.15
        let closeButton = ImageButton(frame: CGRect(x: SCREEN.WIDTH - closeButtonSize, y: STATUS_BAR_HEIGHT, width: closeButtonSize, height: closeButtonSize), image: UIImage(named: "btnX2"), ratio: 0.5)
        self.addSubview(closeButton)
        closeButton.addTarget(event: .touchUpInside) { (button) in
            if isLogin {
                listVC.photoListSelectButtonPressed(button: listVC.photoListSelectButtons[2])
            }else{
                listVC.photoListSelectButtonPressed(button: listVC.photoListSelectButtons[0])
            }
            self.removeFromSuperview()
        }
        
        
        
        let attendButtonHeight : CGFloat = 50
        let attendButton = UIButton(frame: CGRect(x: 0, y: SCREEN.HEIGHT - attendButtonHeight - SAFE_AREA, width: SCREEN.WIDTH, height: attendButtonHeight + SAFE_AREA))
        attendButton.center.x = SCREEN.WIDTH / 2
        attendButton.backgroundColor = #colorLiteral(red: 0.164933145, green: 0.5954117179, blue: 1, alpha: 1)
        self.addSubview(attendButton)
        
        let attendButtonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: attendButtonHeight))
        attendButtonLabel.isUserInteractionEnabled = false
        attendButtonLabel.text = "Join the Event"
        attendButtonLabel.textColor = UIColor.white
        attendButtonLabel.textAlignment = .center
        attendButtonLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: attendButtonLabel.frame.size.height * 0.35)
        attendButton.addSubview(attendButtonLabel)
        attendButton.addTarget(event: .touchUpInside) { (button) in
            let photojenicAwardVC = PhotojenicAwardViewController()
            photojenicAwardVC.photoListVC = listVC
            photojenicAwardVC.modalPresentationStyle = .fullScreen
            listVC.present(photojenicAwardVC, animated: true, completion: {
                listVC.photoListSelectButtonPressed(button: listVC.photoListSelectButtons[2])
                self.removeFromSuperview()
            })
        }
        
        let noticeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: attendButton.frame.size.width, height: attendButton.frame.minY - closeButton.frame.maxY))
        noticeImageView.setImageWithFrameHeight(image: UIImage(named: "Photogenic"))
        self.addSubview(noticeImageView)
        noticeImageView.center.x = SCREEN.WIDTH / 2
        noticeImageView.frame.origin.y = closeButton.frame.maxY
        noticeImageView.isUserInteractionEnabled = true
        attendButton.frame.origin.y = noticeImageView.frame.maxY
        
        
        // 포토이벤트 url 변경
        webView = WebView(frame: CGRect(
            x: 0,
            y: 0,
            width: SCREEN.WIDTH,
//            height: attendButton.frame.minY), urlString: "https://www.korl.or.kr/app/2022f/html/event_photo.html")
            height: attendButton.frame.minY), urlString: "https://korl.or.kr/workshop/2023fall/app/html/contents/award.html")
        webView.motherVC = listVC
//        webView.photogenicAwardNoticeView = self
//        self.addSubview(webView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
