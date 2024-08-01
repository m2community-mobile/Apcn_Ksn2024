//사진업로드뷰
//  PhotojenicAwardViewController.swift
//  korl2019f
//
//  Created by JinGu's iMac on 30/09/2019.
//  Copyright © 2019 JinGu's iMac. All rights reserved.
//

import UIKit
import Photos
import FontAwesome_swift

class PhotojenicAwardViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var photoListVC : PhotoListViewController?
    var titleTextField : CustomTextField!
    var countrytitleTextField : CustomTextField!
    
    var photoTitle : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        15,27,82
//        self.view.backgroundColor = #colorLiteral(red: 0.999106586, green: 0.9897050261, blue: 0.9658934474, alpha: 1)
        self.view.backgroundColor = .white
        
        let bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: SCREEN.HEIGHT))
        bgImageView.setImageWithFrameHeight(image: UIImage(named: "photojenicBG"))
        
//        if IS_NORCH {
//            bgImageView.setImageWithFrameHeight(image: UIImage(named: "bg_Max"))
//        }else{
//            bgImageView.setImageWithFrameHeight(image: UIImage(named: "bg_Plus"))
//        }
//        self.view.addSubview(bgImageView)
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = UIColor.clear
        self.view.addSubview(statusBar)
        
        let naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: NAVIGATION_BAR_HEIGHT))
        naviBar.backgroundColor = UIColor.clear
        self.view.addSubview(naviBar)
        
        
        
        var photoBg = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: self.view.frame.height * 3))
//        photoBg.setImageWithFrameHeight(image: UIImage(named: "photoBg"))
        
        photoBg.setImageWithFrameHeight(image: UIImage(named: "photo22"))
        
        if #available(iOS 13.0, *) {
//            var test = UIImage(named: "photo22")?.withTintColor(.lightGray)
            var test = UIImage(named: "photo22")?.withTintColor(#colorLiteral(red: 0.8571965098, green: 0.8571965098, blue: 0.8571965098, alpha: 1))
            photoBg.image = test
        } else {
            // Fallback on earlier versions
        }
        
        
        
//        photoBg.contentMode = .scaleToFill
//        photoBg.frame.size.width *= 2
//        photoBg.center.x = SCREEN.WIDTH / 2
//        photoBg.frame.size.height *= 2
        
        self.view.addSubview(photoBg)
        
        
        let photoUnder = UIImageView(frame: CGRect(x: 0, y: photoBg.frame.maxY - 150, width: SCREEN.WIDTH, height: SCREEN.HEIGHT))
        photoUnder.setImageWithFrameHeight(image: UIImage(named: "photoUnder"))
        photoUnder.contentMode = .scaleAspectFill
        photoUnder.frame.size.width *= 1
        
        photoUnder.frame.size.height *= 1.3
        photoUnder.center.x = SCREEN.WIDTH / 2
        
//        self.view.addSubview(photoUnder)
        
        
        var photoTop = UIImageView(frame: CGRect(x: 0, y: SCREEN.WIDTH * 0.18, width: SCREEN.WIDTH * 0.8, height: SCREEN.HEIGHT * 0.35))
        
        if IS_IPHONE_12PRO {
            photoTop = UIImageView(frame: CGRect(x: 0, y: SCREEN.WIDTH * 0.18, width: SCREEN.WIDTH * 0.8, height: 40))
        }
        if IS_IPHONE_15PRO {
            photoTop = UIImageView(frame: CGRect(x: 0, y: SCREEN.WIDTH * 0.18, width: SCREEN.WIDTH * 0.8, height: 40))
        }
        
        
        photoTop.setImageWithFrameHeight(image: UIImage(named: "photoTop"))
        photoTop.contentMode = .scaleAspectFit
//        photoTop.frame.size.width *= 0.62
        photoTop.center.x = SCREEN.WIDTH / 2
//        photoTitle.frame.size.height *= 0.55
        photoTop.layer.zPosition = 999
        self.view.addSubview(photoTop)
        
        
         photoTitle = UIImageView(frame: CGRect(x: 0, y: photoTop.frame.maxY - 15, width: SCREEN.WIDTH * 0.32, height: SCREEN.HEIGHT * 0.32))
        if IS_IPHONE_N {
            photoTitle = UIImageView(frame: CGRect(x: 0, y: photoTop.frame.maxY - 15, width: SCREEN.WIDTH * 0.25, height: SCREEN.HEIGHT * 0.25))
        }
        photoTitle.setImageWithFrameHeight(image: UIImage(named: "photoCa"))
        photoTitle.contentMode = .scaleAspectFit
//        photoTitle.frame.size.width *= 0.62
        photoTitle.center.x = SCREEN.WIDTH / 2
//        photoTitle.frame.size.height *= 0.55
        self.view.addSubview(photoTitle)
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: photoTitle.frame.maxY + 5, width: SCREEN.WIDTH * 0.9, height: SCREEN.HEIGHT / 10))
        subTitle.text = "Green Nephrology Zone\nPhoto Upload"
//        subTitle.textColor = #colorLiteral(red: 0.1289488673, green: 0.5153582692, blue: 0.5921706557, alpha: 1)
        
        
        
        
        let name = NSAttributedString(string: "\nPhoto Upload", attributes: [.foregroundColor: #colorLiteral(red: 0.9793712497, green: 0.568179965, blue: 0.4004986882, alpha: 1)])

        let greeting = NSMutableAttributedString(string: "Green Nephrology Zone")
        greeting.append(name)

        subTitle.attributedText = greeting
        
        
        
        
        
        
        
        subTitle.font = UIFont.systemFont(ofSize: 28)
        if IS_IPHONE_N {
            subTitle.font = UIFont.systemFont(ofSize: 18)
        }
        subTitle.textAlignment = .center
        subTitle.numberOfLines = 0
        subTitle.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(subTitle)
        
        
        
        
        var addTitleChange = UILabel(frame: CGRect(x: 0, y: photoTitle.frame.maxY + 20, width: SCREEN.WIDTH * 0.95, height: SCREEN.HEIGHT / 10))
        addTitleChange.text = "Take pictures of yourself at various spots in\nAPCN & KSN 2024 and\nshare yourawesome looks with everyone."
        addTitleChange.font = UIFont.systemFont(ofSize: 16)
        
        
        
//        // myLabel의 텍스트를 가지고 옵니다.
//         let text = addTitleChange.text ?? ""
//
//        // myLabel의 text로 NSMutableAttributedString 인스턴스를 만들어줍니다.
//        let attributeString = NSMutableAttributedString(string: text)
//
//        // NSMutableAttributedString에 속성을 추가합니다.
//        // 현재 추가한 속성은 "Pingu"만 빨간색으로 바꾼다! 입니다.
//        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "APCN & KSN 2024"))
//
//        // myLabel에 방금 만든 속성을 적용합니다.
//        addTitleChange.attributedText = attributeString
        
        
        
       
        if IS_IPHONE_12PRO_MAX {
            addTitleChange.font = UIFont.systemFont(ofSize: 20)
        }
        if IS_IPHONE_15PRO_MAX {
            addTitleChange.font = UIFont.systemFont(ofSize: 20)
        }
        
        
        
        if IS_IPHONE_N {
            addTitleChange.font = UIFont.systemFont(ofSize: 15)
        }
        if IS_IPHONE_12PRO {
            addTitleChange.font = UIFont.systemFont(ofSize: 17)
        }
        if IS_IPHONE_15PRO {
            addTitleChange.font = UIFont.systemFont(ofSize: 17)
        }
        
        
        //value로 사용할 내가 적용하고싶은 폰트 사이즈 객체 생성
        var fontSize = UIFont.boldSystemFont(ofSize: 17)
        
        
         if IS_IPHONE_12PRO_MAX {
             fontSize = UIFont.boldSystemFont(ofSize: 21)
         }
         if IS_IPHONE_15PRO_MAX {
             fontSize = UIFont.boldSystemFont(ofSize: 21)
         }
        
        
        
        if IS_IPHONE_N {
            fontSize = UIFont.boldSystemFont(ofSize: 17)
        }
        if IS_IPHONE_12PRO {
            fontSize = UIFont.boldSystemFont(ofSize: 19)
        }
        if IS_IPHONE_15PRO {
            fontSize = UIFont.boldSystemFont(ofSize: 19)
        }
        
        

        //NSMutableAttributedString객체를 생성한다.(label에 있는 Text를 이용한다.)
        let attributedStr = NSMutableAttributedString(string: addTitleChange.text!)

        //위에서 만든 attributedStr에, addAttribute()메소드를 통해 스타일 적용.
        attributedStr.addAttribute(.font, value: fontSize, range: (addTitleChange.text! as NSString).range(of: "APCN & KSN 2024"))
//        attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: (addTitleChange.text! as NSString).range(of:"5일"))
                
        //최종적으로 내 label에 text가 아닌, attributedText를 적용
        addTitleChange.attributedText = attributedStr
        
        addTitleChange.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addTitleChange.textAlignment = .center
        addTitleChange.numberOfLines = 0
        addTitleChange.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(addTitleChange)
        
        
        
        
        
        var addTitle = UILabel(frame: CGRect(x: 0, y: subTitle.frame.maxY, width: SCREEN.WIDTH * 0.9, height: SCREEN.HEIGHT / 18))
        addTitle.text = "APCN & KSN 2024 Goes Green!"
        addTitle.font = UIFont.systemFont(ofSize: 24)
        if IS_IPHONE_N {
            addTitle.font = UIFont.systemFont(ofSize: 18)
        }
        addTitle.textColor = #colorLiteral(red: 0.2947583199, green: 0.1996938586, blue: 0.5355442166, alpha: 1)
        addTitle.textAlignment = .center
        addTitle.numberOfLines = 0
        addTitle.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(addTitle)
        
        var addTitle2 = UILabel(frame: CGRect(x: 0, y: addTitle.frame.maxY - 10, width: SCREEN.WIDTH * 0.9, height: SCREEN.HEIGHT / 30))
        addTitle2.text = "Your efforts to reduce environmental impact"
        addTitle2.font = UIFont.systemFont(ofSize: 15)
        if IS_IPHONE_N {
            addTitle2.font = UIFont.systemFont(ofSize: 13)
        }
        addTitle2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addTitle2.textAlignment = .center
        addTitle2.numberOfLines = 0
        addTitle2.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(addTitle2)
        
        

        
        let photoTitleSub = UIImageView(frame: CGRect(x: photoTitle.minX, y: SCREEN.WIDTH * 0.55, width: SCREEN.WIDTH, height: SCREEN.HEIGHT))
        photoTitleSub.setImageWithFrameHeight(image: UIImage(named: "photoTitleSub"))
        photoTitleSub.contentMode = .scaleAspectFit
        photoTitleSub.frame.size.width *= 0.8
//        photoTitleSub.frame.size.height *= 0.8
//        self.view.addSubview(photoTitleSub)
        
        
        let titleLabel1 = UILabel(frame: CGRect(x: 0, y: SCREEN.HEIGHT * 0.15, width: SCREEN.WIDTH, height: 50))
        if !IS_NORCH {
            titleLabel1.frame.origin.y = SCREEN.HEIGHT * 0.12
        }
//        titleLabel1.text = "Photogenic Award"
        titleLabel1.text = ""
        titleLabel1.textColor = UIColor.white
        titleLabel1.textAlignment = .center
        titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 45)
        if IS_IPHONE_12PRO {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_15PRO {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_MAX {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_XR {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_MINI {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_N_PLUS {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 40)
        }
        if IS_IPHONE_N {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 35)
        }
        if IS_IPHONE_SE {
            titleLabel1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 25)
        }
        titleLabel1.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(titleLabel1)
        
        let titleLabel2 = UILabel(frame: CGRect(x: 0, y: titleLabel1.frame.maxY, width: SCREEN.WIDTH * 0.9, height: 150))
        if IS_IPHONE_SE {
            titleLabel2.frame.size.height = 110
        }
        titleLabel2.numberOfLines = 0
//        titleLabel2.text = """
//        이비인후과 종합학술대회의
//        사진을 올려주시면 베스트포토를 선정하여 선물을
//        드립니다.
//        회원님의 많은 참여를 부탁드립니다.
//        """
        titleLabel2.text = """
        
        """
//        if IS_IPHONE_N_PLUS {
//            titleLabel2.text = """
//            이비인후과학회 종합학술대회의 사진을
//            올려주시면 베스트 포토를 선정하여 선물을 드립니다.
//            회원님의 많은 참여를 부탁드립니다.
//            """
//        }
        titleLabel2.textColor = UIColor.white
        titleLabel2.textAlignment = .center
        titleLabel2.font = UIFont(name: Nanum_Barun_Gothic_OTF_Light, size: 20)
        if IS_IPHONE_SE {
        titleLabel2.font = UIFont(name: Nanum_Barun_Gothic_OTF_Light, size: 15)
        }
        titleLabel2.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(titleLabel2)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: addTitleChange.maxY + 20, width: SCREEN.WIDTH * 0.9, height: 50))
        label1.text = "Name"
        label1.textColor = UIColor.black
        
//        label1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 22)
        label1.font = UIFont.systemFont(ofSize: 17)
        if IS_IPHONE_SE {
            label1.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        }
        label1.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(label1)
        
        var contentHeight : CGFloat = 50
        if IS_IPHONE_SE {
            contentHeight = 45
        }
        titleTextField = CustomTextField(frame: CGRect(x: 0, y: addTitle2.frame.maxY + 40, width: SCREEN.WIDTH * 0.8, height: contentHeight), placeholder: "", isSecureTextEntry: false)
        if IS_IPHONE_N {
            titleTextField = CustomTextField(frame: CGRect(x: 0, y: addTitle2.frame.maxY + 20, width: SCREEN.WIDTH * 0.8, height: contentHeight), placeholder: "", isSecureTextEntry: false)
        }
        
        titleTextField.center.x = SCREEN.WIDTH / 2
        titleTextField.textField.placeholder = "Name"
        titleTextField.textField.textAlignment = .left
        self.view.addSubview(titleTextField)
        
        countrytitleTextField = CustomTextField(frame: CGRect(x: 0, y: titleTextField.frame.maxY + 5, width: SCREEN.WIDTH * 0.8, height: contentHeight), placeholder: "", isSecureTextEntry: false)
        countrytitleTextField.center.x = SCREEN.WIDTH / 2
    
        countrytitleTextField.textField.placeholder = "Country/Region"
        countrytitleTextField.textField.textAlignment = .left
        self.view.addSubview(countrytitleTextField)
        
        
//        let cameraButton = PhotojenicIconButton(frame: CGRect(x: 0, y: titleTextField.frame.maxY + 10, width: SCREEN.WIDTH * 0.9, height: contentHeight), name: "Camera", fontAwesome: FontAwesome.camera, fontAwesomeStyle: FontAwesomeStyle.solid)
        let cameraButton = UIButton(frame: CGRect(x: 0, y: countrytitleTextField.frame.maxY + 10, width: SCREEN.WIDTH * 0.8, height: contentHeight))
        cameraButton.setTitle("Camera", for: .normal)
        cameraButton.setImage(UIImage(named: "camera"), for: .normal)
        cameraButton.imageEdgeInsets = .init(top: 0, left: -10, bottom: 0, right: 0)
    
        
        cameraButton.backgroundColor = #colorLiteral(red: 0.6311272383, green: 0.2540305555, blue: 0.6745771766, alpha: 1)
//        cameraButton.nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
        if IS_IPHONE_SE {
//            cameraButton.nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        }
        cameraButton.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(cameraButton)
        

//        let albumButton = PhotojenicIconButton(frame: CGRect(x: 0, y: cameraButton.frame.maxY + 10, width: SCREEN.WIDTH * 0.9, height: contentHeight), name: "Album", fontAwesome: FontAwesome.image, fontAwesomeStyle: FontAwesomeStyle.solid)
        let albumButton = UIButton(frame: CGRect(x: 0, y: cameraButton.frame.maxY + 10, width: SCREEN.WIDTH * 0.8, height: contentHeight))
        albumButton.setTitle("Album", for: .normal)
        albumButton.setImage(UIImage(named: "album"), for: .normal)
        albumButton.imageEdgeInsets = .init(top: 0, left: -15, bottom: 0, right: 0)
        albumButton.backgroundColor = #colorLiteral(red: 0.2990480959, green: 0.2042169869, blue: 0.5393954515, alpha: 1)
//        albumButton.nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
        if IS_IPHONE_SE {
//            albumButton.nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        }
        albumButton.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(albumButton)
        

//카메라 업로드 cancel 버튼
        let closeButton = UIButton(frame: CGRect(x: 0, y: SCREEN.HEIGHT - SAFE_AREA - contentHeight, width: SCREEN.WIDTH, height: contentHeight + SAFE_AREA))
        closeButton.backgroundColor = #colorLiteral(red: 0.3678600192, green: 0.437746048, blue: 0.4973118305, alpha: 1)
        self.view.addSubview(closeButton)
        closeButton.addTarget(event: .touchUpInside) { (button) in
            
            print("click cancel")
            
            let vc = PhotoListViewController()

            appDel.naviCon?.popToRootViewController(animated: false)
            appDel.naviCon?.pushViewController(vc, animated: true)
            
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: false)
//            
            
            
            
            
            appDel.leftView?.close()
            appDel.allDismiss(complete: {})
            
            
            self.dismiss(animated: true, completion: {
                
            })
        }
        
        let closeButtonLabel = UILabel(frame: closeButton.bounds)
        closeButtonLabel.frame.size.height = contentHeight
        closeButtonLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
        closeButtonLabel.backgroundColor = #colorLiteral(red: 0.3678600192, green: 0.437746048, blue: 0.4973118305, alpha: 1)
        closeButtonLabel.textColor = UIColor.white
        closeButtonLabel.isUserInteractionEnabled = false
        closeButtonLabel.text = "Cancel"
        closeButtonLabel.textAlignment = .center
        if IS_IPHONE_SE {
            closeButtonLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        }
        closeButton.addSubview(closeButtonLabel)
        
//        .setTitleColor(UIColor.white, for: .normal)
//        closeButton.setTitle("취소", for: .normal)
//        closeButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
//        if IS_IPHONE_SE {
//            closeButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
//        }
        
        
        
        
        
        
        cameraButton.addTarget(event: .touchUpInside) { (button) in
            
            if self.titleTextField.textField.text?.replacingOccurrences(of: " ", with: "") == "" {
                toastShow(message: "Please enter name")
                return
            }
            
            
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (grant : Bool) in
                if grant {
                    DispatchQueue.main.async {
                        let imagePickerController = UIImagePickerController()
                        imagePickerController.sourceType = .camera
                        imagePickerController.showsCameraControls = true
                        imagePickerController.delegate = self
                        self.present(imagePickerController, animated: true) { }
                    }
                }else{
                    DispatchQueue.main.async {
                        appDel.showAlert(title: "Notice", message: "You cannot access the camera.\nSettings > Privacy > Camera > \(APP_NAME) App")
                        
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        
                    }
                }
            })
        }
        
        albumButton.addTarget(event: .touchUpInside) { (button) in
            
            if self.titleTextField.textField.text?.replacingOccurrences(of: " ", with: "") == "" {
                toastShow(message: "Please enter name")
                return
            }
            if self.countrytitleTextField.textField.text?.replacingOccurrences(of: " ", with: "") == "" {
                toastShow(message: "Please enter country")
                return
            }
            
            PHPhotoLibrary.requestAuthorization({ (state : PHAuthorizationStatus) in
                if state == .authorized {
                    DispatchQueue.main.async {
                        let imagePickerController = UIImagePickerController()
                        imagePickerController.sourceType = .photoLibrary
                        imagePickerController.delegate = self
                        self.present(imagePickerController, animated: true) { }
                    }
                }else{
                    DispatchQueue.main.async {
                        appDel.showAlert(title: "Notice", message: "You cannot access the album.\nSettings > Privacy > album > \(APP_NAME) App")
                    }
                }
            })
        }
    }
    
    class PhotojenicIconButton : UIButton {
        var iconImageView : UIImageView!
        var nameLabel : UILabel!
        
        init(frame: CGRect, name : String, fontAwesome : FontAwesome, fontAwesomeStyle : FontAwesomeStyle = .solid) {
            super.init(frame: frame)
            
            let innerView = UIView(frame: self.bounds)
            innerView.isUserInteractionEnabled = false
            self.addSubview(innerView)
            
            let iconImageRatio : CGFloat = 0.7
            iconImageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height * iconImageRatio, height: self.frame.size.height * iconImageRatio))
            iconImageView.image = UIImage.fontAwesomeIcon(name: fontAwesome, style: FontAwesomeStyle.solid, textColor: UIColor.white, size: iconImageView.frame.size)
            iconImageView.center.y = self.frame.size.height / 2
            iconImageView.isUserInteractionEnabled = false
            innerView.addSubview(iconImageView)
            
            nameLabel = UILabel(frame: CGRect(x: iconImageView.frame.maxX + 10, y: 0, width: 100, height: self.frame.size.height))
            nameLabel.numberOfLines = 0
            nameLabel.textAlignment = .center
            nameLabel.text = name
            nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
            nameLabel.sizeToFit()
            nameLabel.center.y = self.frame.size.height / 2
            nameLabel.isUserInteractionEnabled = false
            innerView.addSubview(nameLabel)
            
            innerView.frame.size.width = nameLabel.frame.maxX
            innerView.center.x = self.frame.size.width / 2
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class CustomTextField: UIButton {
        
        var motherVC : UIViewController?
        
        var textField : UITextField!
        
        private override init(frame: CGRect) {
            super.init(frame:frame)
        }
        
        convenience init(frame : CGRect, placeholder : String = "", isSecureTextEntry : Bool = false) {
            self.init(frame: frame)
            
            
            self.backgroundColor = UIColor.white
            self.layer.borderColor = #colorLiteral(red: 0.7490196078, green: 0.7490196078, blue: 0.7490196078, alpha: 1).cgColor
            self.layer.borderWidth = 0.5
            
            //?/
            var textFontSize : CGFloat = 18
            if IS_IPHONE_N {
                textFontSize = 16
            }
            if IS_IPHONE_X {
                textFontSize = 16
            }
            if IS_IPHONE_SE {
                textFontSize = 14
            }
            
            textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.frame.size.width - 30, height: self.frame.size.height))
            textField.center.x = self.frame.size.width / 2
            textField.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: textFontSize)
            textField.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textField.delegate = motherVC
            textField.textAlignment = .center
            textField.addDoneCancelToolbar()
            textField.isSecureTextEntry = isSecureTextEntry
            
            let idTextFieldAttributedPlaceholder : [NSAttributedString.Key : NSObject] = [
                .font : UIFont(name: Nanum_Barun_Gothic_OTF, size: textFontSize)!,
                .foregroundColor : #colorLiteral(red: 0.6549019608, green: 0.6588235294, blue: 0.662745098, alpha: 1)
            ]
            textField.attributedPlaceholder = NSMutableAttributedString(stringsInfos: [(placeholder,idTextFieldAttributedPlaceholder)])
            
            self.addSubview(textField)
            
            self.addTarget(event: .touchUpInside) { (button) in self.textField.becomeFirstResponder() }
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}

extension PhotojenicAwardViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        print("업로드1")
        if let getImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("업로드2")
            resize(image: getImage) { (kResizedImage : UIImage?) in
                if let resizedImage = kResizedImage {
                    print("업로드3")
                    guard let imageData = resizedImage.pngData() else { return print("make png fail") }
                    let imageString = imageData.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithLineFeed)
                    
                    
                
                    
                    var formatter = DateFormatter()
                    formatter.dateFormat = "yyyy.MM.dd"
                    var current_date_string = formatter.string(from: Date())
                    print(current_date_string)
                    
                    
//                    Server.postData(urlString: "http://ezv.kr/voting/admin/php/photo/list.php?tab=-1", otherInfo: ["img":imageString,"code":code,"deviceid":deviceID,"title":self.titleTextField.textField.text!,"country":self.countrytitleTextField.textField.text!]) { (kData : Data?) in
//                        if let data = kData {
                    Server.postData(urlString: "http://ezv.kr/voting/php/photo/photo_upload.php?code=apcn_app", otherInfo: ["img":imageString,"code":code,"deviceid":deviceID,"title":self.titleTextField.textField.text!,"etc1":self.countrytitleTextField.textField.text!,"date":current_date_string]) { (kData : Data?) in
                        if let data = kData {
                            print("업로드4")
                            print("sendPhoto 1: \(String(describing: data.toString()))")
                            if let photoListVC = self.photoListVC {
                                photoListVC.photoMenuListUpdate(index: photoListVC.currentIndex)
                            }
                            self.dismiss(animated: true, completion: {
                                print("업로드5")
//                                toastShow(message: "사진이 업로드되었습니다.")
                                toastShow(message: "Photo upload success")
                                
                                
                                
                            })
                            let vc = PhotoListViewController()
                        

                        appDel.naviCon?.popToRootViewController(animated: false)
                        appDel.naviCon?.pushViewController(vc, animated: false)
                        appDel.leftView?.close()
                            
                            
                            
                        }
                    }
                    
                }
            }
        }
        
        
        
        picker.dismiss(animated: true) { }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true) { }
    }
}
