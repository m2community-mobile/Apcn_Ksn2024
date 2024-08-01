import UIKit
import SDWebImage
import FontAwesome_swift

import Photos

//struct PHOTO_LIST_INFO {
//    struct KEY {
//        static let TITLE = "TITLE"
//        static let URL = "URL"
//        static let TAB = "TAB"
//    }
//    
//    static let INFO = [
//        [
//            KEY.TITLE : "2023.10.12(Thu)",
//            KEY.TAB : "471"
//        ],
//        [
//            KEY.TITLE : "2023.10.13(Fri)",
//            KEY.TAB : "472"
//        ],
////        [
////            KEY.TITLE : "September 3 (Sat)",
////            KEY.TAB : "372"
////        ],
//        [
//            KEY.TITLE : "Photogenic Award",
//            KEY.TAB : "-1"
//        ],
//        
//    ]
//    
//}

struct PHOTO_LIST_INFO {
    struct KEY {
        static let TITLE = "TITLE"
        static let URL = "URL"
        static let TAB = "TAB"
    }

    static let INFO = [
        [
            KEY.TITLE : "June 13 (Thu)",
            KEY.TAB : "577"
        ],
        [
            KEY.TITLE : "June 14 (Fri)",
            KEY.TAB : "578"
        ],
        [
            KEY.TITLE : "June 15 (Sat)",
            KEY.TAB : "579"
        ],
        [
            KEY.TITLE : "June 16 (Sun)",
            KEY.TAB : "580"
        ],
//        [
//            KEY.TITLE : "Green Nephrology Zone",
//            KEY.TAB : "521"
//        ],
    ]

}

class PhotoListViewController: BaseViewController {
    
    var dataArray = [[String:Any]]()
    var imageCollectionView : UICollectionView!
    
    let addNewImageButtonHeight : CGFloat = 50
    var addNewImageButton : UIButton!
    
    var segBackView : UIView!
    var segBackView2 : UIButton!
    
    var testI : UIImage!
    var testim : UIImageView!
    
    
    var testI1 : UIImage!
    var testim1 : UIImageView!
    
    
    var photoListSelectButton: PhotoListSelectButton!
    
//    var mainBottomViewBackView : UIView!
    let bottomView = BottomView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    let collectionViewLayout = PhotoCollectionViewLayout()
    
    var photoListSelectButtons = [PhotoListSelectButton]()
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        self.photoMenuListUpdate(index: self.currentIndex)
////        photoMenuListUpdate(index: nil)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.85
        
        if IS_IPHONE_12PRO {
            addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.84
        }
        if IS_IPHONE_15PRO {
            addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.84
        }
        
        if IS_IPHONE_N {
            addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.842
        }
        if IS_IPHONE_N_PLUS {
            addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.86
        }
        if IS_IPHONE_MINI {
            addNewImageButton.frame.origin.y = SCREEN.HEIGHT * 0.835
        }
        
        
        print("?????\(UserDefaults.standard.object(forKey: "q") ?? 0)")
        
        
        if UserDefaults.standard.object(forKey: "q") as! Int == 100 {
            
            var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)&tab=-1"
    //        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
    
    
    
//                 if let kIndex = index,
//                    kIndex < PHOTO_LIST_INFO.INFO.count {
//                     let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
//                     currentIndex = kIndex
//                     urlString = urlString + "&tab=-1"
//
//
//                 }
    
            print("urlString:\(urlString)")
            let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
                guard let self = self else { return }
                if let data = kData {
                    if let array = data.toJson() as? [[String:Any]] {
                        print("array:\(array)")
                        self.dataArray = array
                        self.collectionViewLayout.numberOfitem = self.dataArray.count
                        self.imageCollectionView.reloadData()
    
                    }
                    else{
                        print("데이터 없음")
                        self.dataArray = [[String:Any]]()
                        self.collectionViewLayout.numberOfitem = self.dataArray.count
                        self.imageCollectionView.reloadData()
                    }
                }
    
            }
        } else if UserDefaults.standard.object(forKey: "q") as! Int == 10 {
            photoMenuListUpdate(index: 0)
//            UserDefaults.standard.removeObject(forKey: "q")
        } else if UserDefaults.standard.object(forKey: "q") as! Int == 11 {
            photoMenuListUpdate(index: 1)
//            UserDefaults.standard.removeObject(forKey: "q")
        } else if UserDefaults.standard.object(forKey: "q") as! Int == 12 {
            photoMenuListUpdate(index: 2)
//            UserDefaults.standard.removeObject(forKey: "q")
        } else if UserDefaults.standard.object(forKey: "q") as! Int == 13 {
            photoMenuListUpdate(index: 3)
//            UserDefaults.standard.removeObject(forKey: "q")
        } else if UserDefaults.standard.object(forKey: "q") == nil {
            
        }
        
        
//        if UserDefaults.standard.object(forKey: "q") as! Int == 100 {
//            print("photoMenuListUpdate:\(String(describing: index))")
//                         var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)&tab=-1"
//                 //        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
//                 
//                 
//                 
//        //                 if let kIndex = index,
//        //                    kIndex < PHOTO_LIST_INFO.INFO.count {
//        //                     let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
//        //                     currentIndex = kIndex
//        //                     urlString = urlString + "&tab=-1"
//        //
//        //
//        //                 }
//                 
//                         print("urlString:\(urlString)")
//                         let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
//                             guard let self = self else { return }
//                             if let data = kData {
//                                 if let array = data.toJson() as? [[String:Any]] {
//                                     print("array:\(array)")
//                                     self.dataArray = array
//                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
//                                     self.imageCollectionView.reloadData()
//                 
//                                 }
//                                 else{
//                                     print("데이터 없음")
//                                     self.dataArray = [[String:Any]]()
//                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
//                                     self.imageCollectionView.reloadData()
//                                 }
//                             }
//                 
//                         }
//        } else if UserDefaults.standard.object(forKey: "q") as! Int == 10 {
//            photoMenuListUpdate(index: 0)
//            UserDefaults.standard.removeObject(forKey: "q")
//        } else if UserDefaults.standard.object(forKey: "q") as! Int == 11 {
//            photoMenuListUpdate(index: 1)
//            UserDefaults.standard.removeObject(forKey: "q")
//        } else if UserDefaults.standard.object(forKey: "q") as! Int == 12 {
//            photoMenuListUpdate(index: 2)
//            UserDefaults.standard.removeObject(forKey: "q")
//        } else if UserDefaults.standard.object(forKey: "q") as! Int == 13 {
//            photoMenuListUpdate(index: 3)
//            UserDefaults.standard.removeObject(forKey: "q")
//        } else if UserDefaults.standard.object(forKey: "q") == nil {
//            
//        }
    }
    
    
    
//    if UserDefaults.standard.object(forKey: "q") as! Int == 0 {
//        
//    } else if UserDefaults.standard.object(forKey: "q") as! Int == 10 {
//        photoMenuListUpdate(index: 0)
//        UserDefaults.standard.removeObject(forKey: "q")
//    } else if UserDefaults.standard.object(forKey: "q") as! Int == 11 {
//        photoMenuListUpdate(index: 1)
//        UserDefaults.standard.removeObject(forKey: "q")
//    } else if UserDefaults.standard.object(forKey: "q") as! Int == 12 {
//        photoMenuListUpdate(index: 2)
//        UserDefaults.standard.removeObject(forKey: "q")
//    } else if UserDefaults.standard.object(forKey: "q") as! Int == 13 {
//        photoMenuListUpdate(index: 3)
//        UserDefaults.standard.removeObject(forKey: "q")
//    } else if UserDefaults.standard.object(forKey: "q") == nil {
//        
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        self.subTitleLabel.text = "Photo Gallery"
        
//        self.subTitleView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
//        self.subTitleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
//        segBackView2 = UIButton(frame: CGRect(x: 0, y: segBackView.frame.maxY + 5, width: SCREEN.WIDTH * 0.9, height: 70))
        
        segBackView2 = UIButton(frame: CGRect(x: 0, y: subTitleView.frame.maxY, width: SCREEN.WIDTH, height: 100))
        
//        segBackView.frame.size.height = 0
//        segBackView2.applyGradient4(colors: [UIColor(red: 0.9934825301, green: 0.9966033101, blue: 1, alpha: 1).cgColor, UIColor(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1).cgColor])
        
        if let imageView = segBackView2.imageView {
            segBackView2.bringSubviewToFront(imageView)
        }
        
//        segBackView2.backgroundColor = UIColor(white: 137/255, alpha: 1)
        segBackView2.clipsToBounds = true
        
//        segBackView2.setTitle("          Green Neohrology Zone", for: .normal)
//        segBackView2.contentVerticalAlignment = .top
        
        segBackView2.setTitleColor(.black, for: .normal)
//        segBackView2.setImage(UIImage(named: "green"), for: .normal)
//        segBackView2.imageEdgeInsets = .init(top: 10, left: 15, bottom: 10, right: 15)
        
        
        var plView2 = UIImageView()
        
//        var plView = UIImageView()
        
//        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
        if IS_IPHONE_N_PLUS {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4, y: 16, width: 20, height: 20))
        }
//        else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        }
        else if IS_IPHONE_N {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4.4, y: 18, width: 15, height: 15))
        }else if IS_IPHONE_MINI {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4.4, y: 18, width: 15, height: 15))
        } else if IS_IPHONE_12PRO_MAX {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4, y: 18, width: 20, height: 20))
        } else if IS_IPHONE_15PRO_MAX {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4, y: 16, width: 20, height: 20))
        } else if IS_IPHONE_12PRO {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4.4, y: 17, width: 17, height: 18))
        } else if IS_IPHONE_15PRO {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4.4, y: 17, width: 17, height: 18))
        } else {
            plView2 = UIImageView(frame: CGRect(x: segBackView2.frame.size.width / 4.2, y: 17, width: 20, height: 20))
        }
        
//        segBackView2.addSubview(plView2)
        
        var imagePl2 = UIImage()
        imagePl2 = UIImage(named: "green")!
        
        plView2.image = imagePl2
//        segBackView2.addSubview(plView2)
        
//        var buttonTitle = UILabel(frame: CGRect(x: plView2.frame.maxX + 10, y: plView2.frame.minY - 7, width: 200, height: 30))
        
        var buttonTitle = UILabel(frame: CGRect(x: 0, y: plView2.frame.minY - 7, width: 200, height: 30))
        buttonTitle.center.x = SCREEN.WIDTH / 2
//        buttonTitle.text = "Green Neohrology Zone"
//        buttonTitle.text = "Share Your Moments!"
        buttonTitle.text = ""
        buttonTitle.textColor = .white
        buttonTitle.textAlignment = .center
//        segBackView2.addGradiant()
//        segBackView2.applyGradient01(colors: [UIColor.yellow.cgColor, UIColor.blue.cgColor])
        
        
         testI = UIImage(named: "testtest")
         testim = UIImageView(frame: segBackView2.bounds)
        testim.image = testI
        
        
        segBackView2.addSubview(testim)
    
        
        
        
        
        
        
        segBackView2.addSubview(buttonTitle)
        
        
//        segBackView2.addTarget(self, action: #selector(photoListSelectButtonPressed(button:)), for: .touchUpInside)
        segBackView2.addTarget(self, action: #selector(pleaseTest(_ :)), for: .touchUpInside)
        
        
//        segBackView2.backgroundColor = #colorLiteral(red: 0.9464361072, green: 0.9497054219, blue: 1, alpha: 1)
//        segBackView2.backgroundColor = .white
//        segBackView2.backgroundColor = #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
        
        
        
 
        
        
        
        
        
//        rightImg
        
        segBackView2.center.x = SCREEN.WIDTH / 2
        self.view.addSubview(segBackView2)
        
        
        
        var buttonTitle2 = UILabel(frame: CGRect(x: 0, y: buttonTitle.frame.maxY + 10, width: SCREEN.WIDTH * 0.8, height: 30))
        buttonTitle2.center.x = SCREEN.WIDTH / 2
        
//        buttonTitle2.text = "Show off your amazing eco-consciousness\nin the Green Nephrology Zone!"
//        buttonTitle2.text = "Show everyone Your Awesome moments\nas you enjoy APCN & KSN 2024!"
        buttonTitle2.text = ""
        buttonTitle2.textColor = .white
        buttonTitle2.textAlignment = .center
        buttonTitle2.numberOfLines = 0
        buttonTitle2.font = UIFont.systemFont(ofSize: 12)
        segBackView2.addSubview(buttonTitle2)
        
        
        
        
        
        
        
        
//        segBackView = UIView(frame: CGRect(x: 0, y: subTitleView.frame.maxY, width: SCREEN.WIDTH, height: 50))
//        segBackView = UIView(frame: CGRect(x: 0, y: subTitleView.frame.maxY, width: SCREEN.WIDTH, height: 50))
        
        segBackView = UIButton(frame: CGRect(x: 0, y: segBackView2.frame.maxY, width: SCREEN.WIDTH, height: 50))
        
        
//        segBackView.frame.size.height = 0
        segBackView.backgroundColor = UIColor(white: 137/255, alpha: 1)
        segBackView.clipsToBounds = true
//        self.view.addSubview(segBackView)
        
        
//        segBackView2 = UIView(frame: CGRect(x: 0, y: segBackView.frame.maxY + 5, width: SCREEN.WIDTH * 0.9, height: 70))
////        segBackView.frame.size.height = 0
//        segBackView2.backgroundColor = UIColor(white: 137/255, alpha: 1)
//        segBackView2.clipsToBounds = true
//        
//        segBackView2.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(segBackView2)
        
        
        
            
                            
            
            
            
        
        #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
        
        
//        segBackView2 = UIButton(frame: CGRect(x: 0, y: segBackView.frame.maxY + 5, width: SCREEN.WIDTH * 0.9, height: 70))
////        segBackView.frame.size.height = 0
//        segBackView2.applyGradient4(colors: [UIColor(red: 0.9934825301, green: 0.9966033101, blue: 1, alpha: 1).cgColor, UIColor(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1).cgColor])
//        
//        if let imageView = segBackView2.imageView {
//            segBackView2.bringSubviewToFront(imageView)
//        }
//        
////        segBackView2.backgroundColor = UIColor(white: 137/255, alpha: 1)
//        segBackView2.clipsToBounds = true
//        
//        segBackView2.setTitle("Green Neohrology Zone    ", for: .normal)
//        segBackView2.setTitleColor(.black, for: .normal)
//        segBackView2.setImage(UIImage(named: "green"), for: .normal)
//        segBackView2.imageEdgeInsets = .init(top: 0, left: -15, bottom: 0, right: 0)
//        segBackView2.addTarget(self, action: #selector(photoListSelectButtonPressed(button:)), for: .touchUpInside)
//        segBackView2.backgroundColor = #colorLiteral(red: 0.9464361072, green: 0.9497054219, blue: 1, alpha: 1)
//        
//        
//        
//        
// 
//        
//        
//        
//        
//        
////        rightImg
//        
//        segBackView2.center.x = SCREEN.WIDTH / 2
//        self.view.addSubview(segBackView2)
//        
//        
//        var testImg = UIImageView(frame: CGRect(x: segBackView2.frame.size.width * 0.85, y: 0, width: 15, height: 15))
//        
//        testImg.center.y = segBackView2.frame.size.height / 2
//        
//        testImg.image = UIImage(named: "rightImg")
//   
//        
//        segBackView2.addSubview(testImg)
        
        
        
        
        
        segBackView2.addTarget(event: .touchUpInside, buttonAction: {button in 
            
//            print("photoMenuListUpdate:\(String(describing: index))")
                 var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)&tab=-1"
         //        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
         
         
         
//                 if let kIndex = index,
//                    kIndex < PHOTO_LIST_INFO.INFO.count {
//                     let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
//                     currentIndex = kIndex
//                     urlString = urlString + "&tab=-1"
//         
//         
//                 }
         
                 print("urlString:\(urlString)")
                 let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
                     guard let self = self else { return }
                     if let data = kData {
                         if let array = data.toJson() as? [[String:Any]] {
                             print("array:\(array)")
                             self.dataArray = array
                             self.collectionViewLayout.numberOfitem = self.dataArray.count
                             self.imageCollectionView.reloadData()
         
                         }
                         else{
                             print("데이터 없음")
                             self.dataArray = [[String:Any]]()
                             self.collectionViewLayout.numberOfitem = self.dataArray.count
                             self.imageCollectionView.reloadData()
                         }
                     }
         
                 }
            
        })
        
       
        

        let photoListSelectButtonWidth : CGFloat = SCREEN.WIDTH / CGFloat(PHOTO_LIST_INFO.INFO.count)
        for i in 0..<PHOTO_LIST_INFO.INFO.count{
             photoListSelectButton = PhotoListSelectButton(frame: CGRect(x: CGFloat(i) * photoListSelectButtonWidth, y: 0, width: photoListSelectButtonWidth, height: segBackView.frame.size.height), name: PHOTO_LIST_INFO.INFO[i][PHOTO_LIST_INFO.KEY.TITLE]!)
            
            segBackView.addSubview(photoListSelectButton)
            self.photoListSelectButton.backgroundColor = .white
            self.photoListSelectButton.nameLabel.textColor = #colorLiteral(red: 0.7242552042, green: 0.7242551446, blue: 0.7242551446, alpha: 1)
            
            photoListSelectButtons.append(photoListSelectButton)
            
            photoListSelectButton.addTarget(self, action: #selector(photoListSelectButtonPressed(button:)), for: .touchUpInside)
            
            
        }
        
        let segUnderView0 = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0.5))
        segUnderView0.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1).withAlphaComponent(0.5)
        self.subTitleView.addSubview(segUnderView0)
        
        let segUnderView1 = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0.5))
        segUnderView1.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1).withAlphaComponent(0.5)
        segBackView.addSubview(segUnderView1)
        
        let segUnderView2 = UIView(frame: CGRect(x: 0, y: segBackView.frame.maxY, width: SCREEN.WIDTH, height: 0.5))
        segUnderView2.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1)
        self.view.addSubview(segUnderView2)
        
        imageCollectionView = UICollectionView(
            frame: CGRect(
                x: 0,
//                y: segUnderView2.frame.maxY + 70,
                
                
//                y: segUnderView2.frame.maxY,
                y: segBackView2.frame.maxY,
                
                width: SCREEN.WIDTH,
                height: bottomView.frame.minY - segUnderView2.frame.maxY - 50),
            collectionViewLayout: collectionViewLayout)
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        imageCollectionView.bounces = false
        imageCollectionView.showsVerticalScrollIndicator = false
        imageCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(imageCollectionView)
        
//        addNewImageButton = UIButton(frame: CGRect(x: 0, y: SCREEN.HEIGHT, width: SCREEN.WIDTH - 35, height: addNewImageButtonHeight))
        addNewImageButton = UIButton(frame: CGRect(x: 0, y: 200, width: SCREEN.WIDTH, height: addNewImageButtonHeight))
        
        
        addNewImageButton.center.x = SCREEN.WIDTH / 2

        
//        addNewImageButton.backgroundColor = #colorLiteral(red: 0.1289488673, green: 0.5153582692, blue: 0.5921706557, alpha: 1)
        addNewImageButton.applyGradient01(colors: [UIColor(red: 0.04577746242, green: 0.1397509575, blue: 0.260271728, alpha: 1).cgColor, UIColor(red: 0.3101695478, green: 0.455506444, blue: 0.5732795596, alpha: 1).cgColor])
//        addNewImageButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.1764705882, blue: 0.3882352941, alpha: 0.74)
//        addNewImageButton.setTitle("Photogenic Award 참여하기", for: .normal)
        
        
    
        
//        addNewImageButton.setTitle("Green Nephrology Zone Photo upload", for: .normal)
        addNewImageButton.setTitle("Photo Upload", for: .normal)
        
        
        addNewImageButton.setImage(UIImage(named: "goGreen"), for: .normal)
        
        if let imageView = addNewImageButton.imageView {
            addNewImageButton.bringSubviewToFront(imageView)
        }
        
        addNewImageButton.imageEdgeInsets = .init(top: 0, left: -15, bottom: 0, right: 0)
        
        addNewImageButton.setTitleColor(UIColor.white, for: .normal)
        addNewImageButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)
        if IS_IPHONE_SE {
        addNewImageButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 17)
        }
        self.view.addSubview(addNewImageButton)
        addNewImageButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addNewImageButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        addNewImageButton.layer.shadowRadius = 10
        addNewImageButton.layer.shadowOpacity = 0.7
        
        
        self.view.addSubview(bottomView)
        
//        let addNewImageButtonView = AddNewImageButtonBackView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: addNewImageButtonHeight), name: "Add Photo")
//        addNewImageButton.addSubview(addNewImageButtonView)
        
        
        addNewImageButton.addTarget(event: .touchUpInside) { (button) in
            let photojenicAwardVC = PhotojenicAwardViewController()
            photojenicAwardVC.photoListVC = self
            photojenicAwardVC.modalPresentationStyle = .fullScreen
            self.present(photojenicAwardVC, animated: true, completion: {
                
            })
            return
        }
        //기본 코드 포토갤러리 텝 이동
//        photoListSelectButtonPressed(button: self.photoListSelectButtons[0])
        
        
        
        if UserDefaults.standard.object(forKey: "path") == nil {
//
            
            ////포토갤러리 눌렀을때
            print("photoMenuListUpdate1:\(String(describing: index))")
            
            UserDefaults.standard.setValue(100, forKey: "q")
            
                         var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)&tab=-1"
                 //        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
                 
                 
                 
        //                 if let kIndex = index,
        //                    kIndex < PHOTO_LIST_INFO.INFO.count {
        //                     let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
        //                     currentIndex = kIndex
        //                     urlString = urlString + "&tab=-1"
        //
        //
        //                 }
                 
                         print("urlString:\(urlString)")
                         let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
                             guard let self = self else { return }
                             if let data = kData {
                                 if let array = data.toJson() as? [[String:Any]] {
                                     print("array:\(array)")
                                     self.dataArray = array
                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
                                     self.imageCollectionView.reloadData()
                 
                                 }
                                 else{
                                     print("데이터 없음")
                                     self.dataArray = [[String:Any]]()
                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
                                     self.imageCollectionView.reloadData()
                                 }
                             }
                 
                         }
            
            
            
            
        } else if UserDefaults.standard.object(forKey: "path") as! Int == 0 {
            photoListSelectButtonPressed(button: self.photoListSelectButtons[0])
        } else if UserDefaults.standard.object(forKey: "path") as! Int == 1 {
            photoListSelectButtonPressed(button: self.photoListSelectButtons[1])
        } else if UserDefaults.standard.object(forKey: "path") as! Int == 2 {
            photoListSelectButtonPressed(button: self.photoListSelectButtons[2])
        } else if UserDefaults.standard.object(forKey: "path") as! Int == 3 {
            photoListSelectButtonPressed(button: self.photoListSelectButtons[3])
        } else {
//            photoListSelectButtonPressed(button: self.photoListSelectButtons[0])
            
            
            
            print("photoMenuListUpdate2:\(String(describing: index))")
                         var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)&tab=-1"
                 //        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
                 
                 
                 
        //                 if let kIndex = index,
        //                    kIndex < PHOTO_LIST_INFO.INFO.count {
        //                     let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
        //                     currentIndex = kIndex
        //                     urlString = urlString + "&tab=-1"
        //
        //
        //                 }
                 
                         print("urlString:\(urlString)")
                         let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
                             guard let self = self else { return }
                             if let data = kData {
                                 if let array = data.toJson() as? [[String:Any]] {
                                     print("array:\(array)")
                                     self.dataArray = array
                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
                                     self.imageCollectionView.reloadData()
                 
                                 }
                                 else{
                                     print("데이터 없음")
                                     self.dataArray = [[String:Any]]()
                                     self.collectionViewLayout.numberOfitem = self.dataArray.count
                                     self.imageCollectionView.reloadData()
                                 }
                             }
                 
                         }
        }
        
        
        UserDefaults.standard.removeObject(forKey: "path")
            
        
        
        
        
//        currentDayUpdate()
        
        
        
        
        let noticeView = PhotogenicAwardNoticeView(listVC: self)
        //포토갤러리 이벤트 페이지
//        self.view.addSubview(noticeView)
        
        
        
        
    }
    
    
    
    
    func currentDayUpdate(){
        //오늘날짜로 업데이트
        
        
        print("업데이트")
        let _ = Server.postData(urlString: "https://ezv.kr:4447/voting/php/session/get_set.php?code=\(code)", otherInfo: [:]) {[weak self] (kData : Data?) in
            guard let self = self else { return }
            
            if let data = kData {
                if let dataDic = data.toJson() as? [String:Any] {
                    print("PAGView dataDic:\(dataDic)")
                    
                    //오늘날짜로 업데이트
                    
                    if let currentTab = dataDic["tab"] as? String {
                        print("currentTab:\(currentTab)")
                        
                        if let todayIndex = PHOTO_LIST_INFO.INFO.firstIndex(where: { photoListInfoDic in
                            if let tab = photoListInfoDic[PHOTO_LIST_INFO.KEY.TAB] {
                                print("PHOTO_LIST_INFO.INFO Tab :\(tab)")
                                return tab == currentTab
                            }
                            return false
                        }) {
                            print("찾은 인덱스:\(todayIndex)")
                            DispatchQueue.main.async {
                                
                                
                                self.photoListSelectButtonPressed(button: self.photoListSelectButtons[todayIndex])
                            }
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
    }

  
    func photoMenuListUpdate2() {
        print("photoMenuListUpdate12\(String(describing: index))")
        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)-1"
//        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
        
        
        
        print("urlString:\(urlString)")
        let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
            guard let self = self else { return }
            if let data = kData {
                if let array = data.toJson() as? [[String:Any]] {
                    print("array:\(array)")
                    self.dataArray = array
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                    
                }
                else{
                    print("데이터 없음")
                    self.dataArray = [[String:Any]]()
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                }
            }
            
        }
    }
    
    
    
    
    
    var currentIndex = 0
    let taps = ["-1"]
    
    //세그웨이1 눌렀을 때
    func photoMenuListUpdate( index : Int? ){
        
        
//        segBackView2.backgroundColor = .white
        
        
        testI1 = UIImage(named: "testtest2")
        testim1 = UIImageView(frame: segBackView2.bounds)
       testim1.image = testI1
       
       
       segBackView2.addSubview(testim1)
        
        
//        segBackView2.setImage(UIImage(named: "testtest2"), for: .normal)
        
//        segBackView2.applyGradient01(colors: [UIColor.blue.cgColor, UIColor.black.cgColor])
        
        
        if UserDefaults.standard.string(forKey: "test") == "test" {
//            segBackView2.backgroundColor = .white
//            segBackView2.applyGradient01(colors: [UIColor.blue.cgColor, UIColor.black.cgColor])
//            segBackView2.setImage(UIImage(named: "testtest2"), for: .normal)
            segBackView2.addSubview(testim1)
        }
        
        UserDefaults.standard.removeObject(forKey: "test")
        
        
        print("photoMenuListUpdate4:\(String(describing: index))")
        
        
        if index == nil {
            UserDefaults.standard.setValue(100, forKey: "q")
    } else if index == 0 {
            UserDefaults.standard.setValue(10, forKey: "q")
        } else if index == 1 {
            UserDefaults.standard.setValue(11, forKey: "q")
        } else if index == 2 {
            UserDefaults.standard.setValue(12, forKey: "q")
        } else if index == 3 {
            UserDefaults.standard.setValue(13, forKey: "q")
        } else {
        }
        
        
        
        
        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)"
//        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
        
        
        
        if let kIndex = index,
           kIndex < PHOTO_LIST_INFO.INFO.count {
            let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
            currentIndex = kIndex
            urlString = urlString + "&tab=\(tab)"
            
            UserDefaults.standard.set(currentIndex, forKey: "current")
            
            print("user: \(UserDefaults.standard.integer(forKey: "current"))")
        }
        
        
        
        
        print("urlString:\(urlString)")
        let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
            guard let self = self else { return }
            if let data = kData {
                if let array = data.toJson() as? [[String:Any]] {
                    print("array:\(array)")
                    self.dataArray = array
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                    
                }
                else{
                    print("데이터 없음")
                    self.dataArray = [[String:Any]]()
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                }
            }
            
        }
    }
    
    
    
    @objc func pleaseTest(_ button: UIButton) {
        UserDefaults.standard.setValue(100, forKey: "q")
        
        UserDefaults.standard.set("test", forKey: "test")
        
        photoListSelectButtons[0].backgroundColor = .white
        photoListSelectButtons[1].backgroundColor = .white
        photoListSelectButtons[2].backgroundColor = .white
        photoListSelectButtons[3].backgroundColor = .white
        
//        segBackView2.setImage(UIImage(named: "testtest"), for: .normal)
        
        segBackView2.addSubview(testim)
        
//        segBackView2.backgroundColor = #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
//        segBackView2.addGradiant()
        
//        segBackView2.applyGradient01(colors: [UIColor.white.cgColor, UIColor.white.cgColor])
        
        
        
//        if UserDefaults.standard.object(forKey: "index") as! Int == 0 {
//            segBackView2.backgroundColor = .white
//        } else if UserDefaults.standard.object(forKey: "index") as! Int == 1 {
//            segBackView2.backgroundColor = .white
//        } else if UserDefaults.standard.object(forKey: "index") as! Int == 2 {
//            segBackView2.backgroundColor = .white
//        } else if UserDefaults.standard.object(forKey: "index") as! Int == 3 {
//            segBackView2.backgroundColor = .white
//        } else {
//            segBackView2.backgroundColor = #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
//            
//        }
        
        
        
        
    }
    
    
    
    @objc func photoListSelectButtonPressed( button : PhotoListSelectButton ){
        
        
        
        
//        segBackView2.backgroundColor = .white
//        segBackView2.backgroundColor = #colorLiteral(red: 0.9257280827, green: 0.9822008014, blue: 1, alpha: 1)
        
        
        
        
//        // 말 그대로 Bool 값을 toggle 합니다.
//           button.isSelected.toggle()
//           
//           // 버튼이 클릭될 때마다, 버튼 이미지를 변환
//           if button.isSelected {
//               
//               segBackView2.backgroundColor = .white
//           } else {
//               segBackView2.backgroundColor = #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
//           }
        
        
//        var isChecked = true
//
//               
//                   isChecked = !isChecked
//                   if isChecked {
//                                      segBackView2.backgroundColor = #colorLiteral(red: 0.9026674628, green: 0.9719232917, blue: 1, alpha: 1)
//                   } else {
//                       segBackView2.backgroundColor = .white
//                   }
        
        
      
        
        
        
        
        var index = 0
        for i in 0..<self.photoListSelectButtons.count {
            let photoListSelectButton = self.photoListSelectButtons[i]
            photoListSelectButton.isSelected = (photoListSelectButton == button)
            
            
            
            if photoListSelectButton == button {
                photoMenuListUpdate(index: i)
                index = i
                
                
                UserDefaults.standard.setValue(index, forKey: "index")
                
            }
        }

        UIView.animate(withDuration: 0.3, animations: {
//            if index == 2 {
//                
//                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT - self.addNewImageButton.frame.size.height
//                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
//                
//                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY - self.addNewImageButton.frame.size.height - 15
//            
//                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
                
//            }else{
////                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT
////                self.imageCollectionView.frame.size.height = SCREEN.HEIGHT - self.segBackView.frame.maxY
//                
            
            
            self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT - self.addNewImageButton.frame.size.height
            self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
            
            self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY - self.addNewImageButton.frame.size.height
        
            self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
            
            
            
            
//                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY
//                self.imageCollectionView.frame.size.height = self.bottomView.frame.minY - self.segBackView.frame.maxY
//            }
        }) { (fi) in

        }
    
        
        
        
        
        
//        print("photoMenuListUpdate:\(String(describing: index))")
//        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)"
////        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
//        
//        
//        
////        if let kIndex = index,
////           kIndex < PHOTO_LIST_INFO.INFO.count {
////            let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
////            currentIndex = kIndex
////            urlString = urlString + "&tab=-1"
//            
//            
////        }
//        
//        print("urlString:\(urlString)")
//        let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
//            guard let self = self else { return }
//            if let data = kData {
//                if let array = data.toJson() as? [[String:Any]] {
//                    print("array:\(array)")
//                    self.dataArray = array
//                    self.collectionViewLayout.numberOfitem = self.dataArray.count
//                    self.imageCollectionView.reloadData()
//                    
//                }
//                else{
//                    print("데이터 없음")
//                    self.dataArray = [[String:Any]]()
//                    self.collectionViewLayout.numberOfitem = self.dataArray.count
//                    self.imageCollectionView.reloadData()
//                }
//            }
//            
//        }
        
        
    
        
        
    }
    
    
    @objc func photoListSelectButtonPressed2( button : PhotoListSelectButton ){
        
//        photoListSelectButtons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        for i in photoListSelectButtons {
            i.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            i.nameLabel.textColor = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
        }
        
//        var index = 0
//        for i in 0..<self.photoListSelectButtons.count {
//            let photoListSelectButton = self.photoListSelectButtons[i]
//            photoListSelectButton.isSelected = (photoListSelectButton == button)
//            
//            if photoListSelectButton == button {
//                photoMenuListUpdate(index: i)
//                index = i
//            }
//        }

        UIView.animate(withDuration: 0.3, animations: {
            
            
            
            
            
            
            
            
            ///////////////
            if self.segBackView2.titleLabel?.text == "Green Neohrology Zone" {
                
                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT - self.addNewImageButton.frame.size.height
                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
                
                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY - self.addNewImageButton.frame.size.height
            
                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
                
            }else{
////                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT
////                self.imageCollectionView.frame.size.height = SCREEN.HEIGHT - self.segBackView.frame.maxY
//
                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY
                self.imageCollectionView.frame.size.height = self.bottomView.frame.minY - self.segBackView.frame.maxY
            }
            ///////////////
        }) { (fi) in

        }
        
        
        
        
        print("photoMenuListUpdate3:\(String(describing: index))")
        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)"
//        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=apcn2024"
        
        
        
//        if let kIndex = index,
//           kIndex < PHOTO_LIST_INFO.INFO.count {
//            let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
//            currentIndex = kIndex
            urlString = urlString + "&tab=-1"
            
            
//        }
        
        print("urlString:\(urlString)")
        let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
            guard let self = self else { return }
            if let data = kData {
                if let array = data.toJson() as? [[String:Any]] {
                    print("array:\(array)")
                    self.dataArray = array
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                    
                }
                else{
                    print("데이터 없음")
                    self.dataArray = [[String:Any]]()
                    self.collectionViewLayout.numberOfitem = self.dataArray.count
                    self.imageCollectionView.reloadData()
                }
            }
            
        }
        
        
    }
    
    
}



extension PhotoListViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        print("update1")
        
        if let getImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("update2")
            if let resizedImage = getImage.resizeForWeb() {
                print("update3")
                guard let imageData = resizedImage.pngData() else { return print("make png fail") }
                let imageString = imageData.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithLineFeed)
                
//                let _ = Server.postData(urlString: "https://ezv.kr:4447/voting/php/photo/photo_upload.php", otherInfo: ["img":imageString,"code":code,"deviceid":deviceID]) { (kData : Data?) in
                    let _ = Server.postData(urlString: "/voting/php/photo/photo_upload.php?code=apcn-app", otherInfo: ["img":imageString,"code":code,"deviceid":deviceID]) { (kData : Data?) in
                    
                    
                
                    
                    if let data = kData {
                        print("update4")
                        print("sendPhoto 2: \(String(describing: data.toString()))")
                        self.photoMenuListUpdate(index: self.currentIndex)
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

extension PhotoListViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PhotoCollectionViewCellDelegate {
    
    //PhotoCollectionViewCellDelegate
    func photoCollectionViewCelldidHeartButtonSelected(index: Int) {
        print("\(index) selected")

        if index >= self.dataArray.count { return }

        var dataDic = self.dataArray[index]

        var nextValue = 0

        guard let sid = dataDic["sid"] as? String else { return print("sid is nil") }
        guard let myfav = dataDic["myfav"] as? String else { return print("myfav is nil")}

        guard let myfavValue = Int(myfav, radix: 10) else { return print("10진수 변환 실패") }
        if myfavValue == 0 { nextValue = 1}
        if myfavValue == 1 { nextValue = 0}

        let urlString = "https://ezv.kr:4447/voting/php/photo/set_favor.php?sid=\(sid)&deviceid=\(deviceID)&val=\(nextValue)"
//        print("set urlString \(urlString)")
        let _ = Server.postData(urlString: urlString, otherInfo: [:]) { (kData : Data?) in
            if let data = kData {
                if let afterCnt = data.toString() {
                    dataDic["cnt"] = afterCnt
                    dataDic["myfav"] = myfavValue == 1 ? "0":"1"
                    self.dataArray[index] = dataDic
                    self.imageCollectionView.reloadData()
                }
//                self.photoMenuListUpdate(index: self.currentIndex)
            }
        }
        
    }
    
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewLayout.numberOfitem
//        return self.collectionViewLayout.numberOfitem
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        cell.index = indexPath.row
        cell.delegate = self
        
        if let fav = dataArray[indexPath.row]["myfav"] as? String {
            if fav == "0" {
//
                cell.heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: .lightGray, size: cell.heartImageView.frame.size)
            } else {
                
                cell.heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: .red, size: cell.heartImageView.frame.size)
            }
        }
        
        
        if let cnt = dataArray[indexPath.row]["cnt"] as? String {
            if let cnt_Int = Int(cnt, radix: 10) {
                cell.numberOfLike = cnt_Int
            }
        }
        
        cell.photoImageView.image = UIImage(named: "thum")
        if let fileURL = dataArray[indexPath.row]["url"] as? String {
            OperationQueue.main.addOperation {
                cell.photoImageView.sd_setImage(with: URL(string: "https://ezv.kr:4447/voting/upload/photo/\(fileURL)"), completed: nil)
            }
        }else{
            cell.photoImageView.image = UIImage(named: "thum")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        
        let photoBaseVC = PhotoPopUpBaseViewController()
        photoBaseVC.photoInfos = self.dataArray
        photoBaseVC.startIndex = indexPath.row
        let naviCon = RotatableNavigationController(rootViewController: photoBaseVC)
        naviCon.modalPresentationStyle = .fullScreen
        self.present(naviCon, animated: true) { }

      
    
        
        
        
    }
    
}

@objc protocol PhotoCollectionViewCellDelegate {
    @objc optional func photoCollectionViewCelldidHeartButtonSelected( index : Int )
}


class PhotoCollectionViewCell: UICollectionViewCell {
    
    var delegate : PhotoCollectionViewCellDelegate?
    
    var defalultImageView : UIImageView!
    var photoImageView : UIImageView!
    
    var heartInfoLabelBackView : UIView!
    var heartImageView : UIImageView!
    var heartInfoLabel : UILabel!
    
    var heartButton : UIButton!
    
    lazy var heartInfoLabelHeight : CGFloat = {
        return self.frame.size.height * 0.15
    }()
    
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame.size = PhotoCollectionViewLayout().photoSize
        
        self.uiSetting()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func uiSetting() {
        
        self.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        self.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        self.layer.borderWidth = 1
        
        defalultImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width * 0.8, height: 0))
        defalultImageView.setImageWithFrameHeight(image: UIImage(named: "thum"))
        defalultImageView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addSubview(defalultImageView)
        
        photoImageView = UIImageView(frame: self.bounds)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        self.addSubview(photoImageView)
        
        heartInfoLabelBackView = UIView(frame: CGRect(x: 0, y: self.frame.size.height - (heartInfoLabelHeight * 2), width: self.frame.size.width, height: heartInfoLabelHeight * 2))
        heartInfoLabelBackView.setGradientBackgroundColor(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
        self.addSubview(heartInfoLabelBackView)
        
        heartImageView = UIImageView(frame: CGRect(x: 15, y: 0, width: heartInfoLabelHeight, height: heartInfoLabelHeight))
        heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1), size: heartImageView.frame.size)
        self.addSubview(heartImageView)
        
        heartButton = UIButton(frame: CGRect(x: 15, y: 0, width: heartInfoLabelHeight * 1.5, height: heartInfoLabelHeight * 1.5))
        heartButton.addTarget(self , action: #selector(heartButtonPressed), for: .touchUpInside)
        self.addSubview(heartButton)
        
        heartInfoLabel = UILabel(frame: CGRect(x: heartImageView.frame.maxX + 3, y: self.frame.size.height - (heartInfoLabelHeight * 1.5), width: self.frame.size.width - (heartImageView.frame.maxX + 3), height: heartInfoLabelHeight))
        heartInfoLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: heartInfoLabelHeight * 0.9)
        heartInfoLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(heartInfoLabel)
        
        heartImageView.center.y = heartInfoLabel.center.y
        heartButton.center = heartImageView.center
        
        
        
    }
    
    @objc func heartButtonPressed(){
        print("heartButtonPressed : \(self.index)")
        self.delegate?.photoCollectionViewCelldidHeartButtonSelected?(index: self.index)
    }
    
    var numberOfLike : Int = 0 {
        willSet(newNumberOfLike){
            
            if newNumberOfLike != 0 {
//                heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: #colorLiteral(red: 0.9450980392, green: 0.05882352941, blue: 0.3725490196, alpha: 1), size: heartImageView.frame.size)
            }else{
//                heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.regular, textColor: #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1), size: heartImageView.frame.size)
            }
            
            heartInfoLabel.text = "\(newNumberOfLike)"
        }
    }
    
   
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.sd_cancelCurrentImageLoad()
    }
}




class PhotoListSelectButton: UIButton {
    
    override var isSelected: Bool {
        
        
        
        
        
        
        willSet(newIsSelected){
            if newIsSelected {
//                self.backgroundColor = #colorLiteral(red: 0.9464361072, green: 0.9497054219, blue: 1, alpha: 1)
                self.backgroundColor = #colorLiteral(red: 0.9257280827, green: 0.9822008014, blue: 1, alpha: 1)
                
                self.nameLabel.textColor = #colorLiteral(red: 0.1411764706, green: 0.2588235294, blue: 0.4431372549, alpha: 1)
//                underBar.isHidden = false
                                underBar.isHidden = true
                
                
                
                
            }else{
                
                self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.nameLabel.textColor = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
                underBar.isHidden = true
                
            }
            
        }
    }
    
    var nameLabel : UILabel!
    var underBar : UIView!
    
    init(frame: CGRect, name : String) {
        super.init(frame: frame)
        
        nameLabel = UILabel(frame: self.bounds)
        nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: nameLabel.height * 0.25)
        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.text = name
        self.addSubview(nameLabel)
        
        underBar = UIView(frame: CGRect(x: 0, y: self.maxY - 1.5, width: self.width, height: 1.5))
        underBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2588235294, blue: 0.4431372549, alpha: 1)
        self.addSubview(underBar)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class AddNewImageButtonBackView: UIView {
    
    var iconImageView : UIImageView!
    var nameLabel : UILabel!
    
    init(frame: CGRect, name kName : String) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = false
        
        let innerView = UIView(frame: self.bounds)
        self.addSubview(innerView)
        
        iconImageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height * 0.5, height: self.frame.size.height * 0.5))
        iconImageView.image = UIImage.fontAwesomeIcon(name: .camera, style: .solid, textColor: UIColor.white, size: iconImageView.frame.size)
        iconImageView.center.y = self.frame.size.height / 2
        iconImageView.isUserInteractionEnabled = false
        innerView.addSubview(iconImageView)
        
        nameLabel = UILabel(frame: CGRect(x: iconImageView.frame.maxX + 10, y: 0, width: 100, height: self.frame.size.height))
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.text = kName
        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 20)
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

func resize(image: UIImage, complete: @escaping ( (_ image : UIImage?) -> Void))
{
    
    let maxSize = max(image.size.width, image.size.height)
    let scale = 720 / maxSize
    
    let transform = CGAffineTransform(scaleX: scale, y: scale)
    let size = image.size.applying(transform)
    UIGraphicsBeginImageContext(size)
    image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let afterImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    complete(afterImage)
    
}




//import UIKit
//import SDWebImage
//import FontAwesome_swift
//
//import Photos
//
//struct PHOTO_LIST_INFO {
//    struct KEY {
//        static let TITLE = "TITLE"
//        static let URL = "URL"
//        static let TAB = "TAB"
//    }
//    
//    static let INFO = [
//        [
//            KEY.TITLE : "June 13 (Thu)",
//            KEY.TAB : "517"
//        ],
//        [
//            KEY.TITLE : "June 14 (Fri)",
//            KEY.TAB : "518"
//        ],
//        [
//            KEY.TITLE : "June 15 (Sat)",
//            KEY.TAB : "519"
//        ],
//        [
//            KEY.TITLE : "June 16 (Sun)",
//            KEY.TAB : "520"
//        ],
//    ]
//    
//}
//
//class PhotoListViewController: BaseViewController {
//    
//    var dataArray = [[String:Any]]()
//    var imageCollectionView : UICollectionView!
//    
//    let addNewImageButtonHeight : CGFloat = 50
//    var addNewImageButton : UIButton!
//    
//    var segBackView : UIView!
//    
////    var mainBottomViewBackView : UIView!
//    let bottomView = BottomView()
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .default
//    }
//    
//    let collectionViewLayout = PhotoCollectionViewLayout()
//    
//    var photoListSelectButtons = [PhotoListSelectButton]()
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        self.photoMenuListUpdate(index: self.currentIndex)
////        photoMenuListUpdate(index: nil)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.subTitleLabel.text = "Photo Gallery"
//        
//        self.subTitleView.backgroundColor = mainColor
//        self.subTitleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        backButtonimageView.image = UIImage.fontAwesomeIcon(name: FontAwesome.arrowLeft, style: .solid, textColor: UIColor.white, size: backButtonimageView.frame.size)
//        
//        segBackView = UIView(frame: CGRect(x: 0, y: subTitleView.frame.maxY, width: SCREEN.WIDTH, height: 50))
////        segBackView.frame.size.height = 0
//        segBackView.clipsToBounds = true
//        self.view.addSubview(segBackView)
//
//        let photoListSelectButtonWidth : CGFloat = SCREEN.WIDTH / CGFloat(PHOTO_LIST_INFO.INFO.count)
//        for i in 0..<PHOTO_LIST_INFO.INFO.count{
//            let photoListSelectButton = PhotoListSelectButton(frame: CGRect(x: CGFloat(i) * photoListSelectButtonWidth, y: 0, width: photoListSelectButtonWidth, height: segBackView.frame.size.height), name: PHOTO_LIST_INFO.INFO[i][PHOTO_LIST_INFO.KEY.TITLE]!)
//            segBackView.addSubview(photoListSelectButton)
//            
//            photoListSelectButtons.append(photoListSelectButton)
//            
//            photoListSelectButton.addTarget(self, action: #selector(photoListSelectButtonPressed(button:)), for: .touchUpInside)
//        }
//        
//        let segUnderView0 = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0.5))
//        segUnderView0.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1).withAlphaComponent(0.5)
//        self.subTitleView.addSubview(segUnderView0)
//        
//        let segUnderView1 = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0.5))
//        segUnderView1.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1).withAlphaComponent(0.5)
//        segBackView.addSubview(segUnderView1)
//        
//        let segUnderView2 = UIView(frame: CGRect(x: 0, y: segBackView.frame.maxY, width: SCREEN.WIDTH, height: 0.5))
//        segUnderView2.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1)
//        self.view.addSubview(segUnderView2)
//        
//        imageCollectionView = UICollectionView(
//            frame: CGRect(
//                x: 0,
//                y: segUnderView2.frame.maxY,
//                width: SCREEN.WIDTH,
//                height: bottomView.frame.minY - segUnderView2.frame.maxY),
//            collectionViewLayout: collectionViewLayout)
//        imageCollectionView.delegate = self
//        imageCollectionView.dataSource = self
//        imageCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
//        imageCollectionView.bounces = false
//        imageCollectionView.showsVerticalScrollIndicator = false
//        imageCollectionView.backgroundColor = UIColor.white
//        self.view.addSubview(imageCollectionView)
//        
//        addNewImageButton = UIButton(frame: CGRect(x: 0, y: SCREEN.HEIGHT, width: SCREEN.WIDTH, height: addNewImageButtonHeight))
//        addNewImageButton.backgroundColor = mainColor
//        self.view.addSubview(addNewImageButton)
//        
//        self.view.addSubview(bottomView)
//        
//        let addNewImageButtonView = AddNewImageButtonBackView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: addNewImageButtonHeight), name: "Add Photo")
//        addNewImageButton.addSubview(addNewImageButtonView)
//        
//        addNewImageButton.addTarget(event: .touchUpInside) { (button) in
//            
//            let photojenicAwardVC = PhotojenicAwardViewController()
//            photojenicAwardVC.photoListVC = self
//            photojenicAwardVC.modalPresentationStyle = .fullScreen
//            self.present(photojenicAwardVC, animated: true, completion: {
//                
//            })
//            return
//            
////            print("addNewImage")
////            
////            
////            let imageSelectAlertCon = UIAlertController(title: "Please select an upload method.", message: nil, preferredStyle: .actionSheet)
////            imageSelectAlertCon.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (action) in
////                print("Camera")
////                
////                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (grant : Bool) in
////                    if grant {
////                        let imagePickerController = UIImagePickerController()
////                        imagePickerController.sourceType = .camera
////                        imagePickerController.showsCameraControls = true
////                        imagePickerController.delegate = self
////                        imagePickerController.modalPresentationStyle = .fullScreen
////                        DispatchQueue.main.async {
////                            self.present(imagePickerController, animated: true) { }
////                        }
////                    }else{
////                        DispatchQueue.main.async {
////                            appDel.showAlert(title: "Notice", message: "You cannot access the camera.\nSettings > Privacy > Camera > \(APP_NAME) App")
////                        }
////                    }
////                })
////                
////            }))
////            imageSelectAlertCon.addAction(UIAlertAction(title: "Album", style: UIAlertAction.Style.default, handler: { (action) in
////                print("Album")
////                
////                PHPhotoLibrary.requestAuthorization({ (state : PHAuthorizationStatus) in
////                    if state == .authorized {
////                        let imagePickerController = UIImagePickerController()
////                        imagePickerController.sourceType = .photoLibrary
////                        imagePickerController.delegate = self
////                        imagePickerController.modalPresentationStyle = .fullScreen
////                        DispatchQueue.main.async {
////                            self.present(imagePickerController, animated: true) { }
////                        }
////                    }else{
////                        DispatchQueue.main.async {
////                            appDel.showAlert(title: "Notice", message: "You cannot access the album.\nSettings > Privacy > album > \(APP_NAME) App")
////
////                        }
////                    }
////                })
////                
////                
////                
////            }))
////            imageSelectAlertCon.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) in
////                print("Cancel")
////            }))
////            self.present(imageSelectAlertCon, animated: true, completion: {
////                
////            })
////            
////        }
//        
//        photoListSelectButtonPressed(button: self.photoListSelectButtons[0])
////        currentDayUpdate()
//    }
//    
//    func currentDayUpdate(){
//        //오늘날짜로 업데이트
//        let _ = Server.postData(urlString: "https://ezv.kr:4447/voting/php/session/get_set.php?code=\(code)", otherInfo: [:]) {[weak self] (kData : Data?) in
//            guard let self = self else { return }
//            
//            if let data = kData {
//                if let dataDic = data.toJson() as? [String:Any] {
//                    print("PAGView dataDic:\(dataDic)")
//                    
//                    //오늘날짜로 업데이트
//                    
//                    if let currentTab = dataDic["tab"] as? String {
//                        print("currentTab:\(currentTab)")
//                        
//                        if let todayIndex = PHOTO_LIST_INFO.INFO.firstIndex(where: { photoListInfoDic in
//                            if let tab = photoListInfoDic[PHOTO_LIST_INFO.KEY.TAB] {
//                                print("PHOTO_LIST_INFO.INFO Tab :\(tab)")
//                                return tab == currentTab
//                            }
//                            return false
//                        }) {
//                            print("찾은 인덱스:\(todayIndex)")
//                            DispatchQueue.main.async {
//                                self.photoListSelectButtonPressed(button: self.photoListSelectButtons[todayIndex])
//                            }
//                        }
//                        
//                        
//                        
//                        
//                    }
//                }
//            }
//        }
//    }
//    
//    var currentIndex = 0
//    let taps = ["-1"]
//    func photoMenuListUpdate( index : Int? ){
//        print("photoMenuListUpdate:\(String(describing: index))")
//        var urlString = "https://ezv.kr:4447/voting/php/photo/get_photo.php?deviceid=\(deviceID)&code=\(code)"
////        var urlString = "http://ezv.kr/voting/admin/php/photo/list.php"
//        if let kIndex = index,
//           kIndex < PHOTO_LIST_INFO.INFO.count {
//            let tab = PHOTO_LIST_INFO.INFO[kIndex][PHOTO_LIST_INFO.KEY.TAB] ?? ""
//            currentIndex = kIndex
//            urlString = urlString + "&tab=\(tab)"
////            urlString = urlString + "?tab=\(tab)"
//        }
//        
//        print("urlString:\(urlString)")
//        let _ = Server.postData(urlString: urlString, otherInfo: [:]){ [weak self] (kData : Data?) in
//            guard let self = self else { return }
//            if let data = kData {
//                if let array = data.toJson() as? [[String:Any]] {
//                    print("array:\(array)")
//                    self.dataArray = array
//                    self.collectionViewLayout.numberOfitem = self.dataArray.count
//                    self.imageCollectionView.reloadData()
//                    
//                }
//                else{
//                    print("데이터 없음")
//                    self.dataArray = [[String:Any]]()
//                    self.collectionViewLayout.numberOfitem = self.dataArray.count
//                    self.imageCollectionView.reloadData()
//                }
//            }
//            
//        }
//    }
//    
//    @objc func photoListSelectButtonPressed( button : PhotoListSelectButton ){
//        
//        var index = 0
//        for i in 0..<self.photoListSelectButtons.count {
//            let photoListSelectButton = self.photoListSelectButtons[i]
//            photoListSelectButton.isSelected = (photoListSelectButton == button)
//            
//            if photoListSelectButton == button {
//                photoMenuListUpdate(index: i)
//                index = i
//            }
//        }
//
//        UIView.animate(withDuration: 0.3, animations: {
//            if index == 10 {
//                
////                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT - self.addNewImageButton.frame.size.height
////                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
//                
//                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY - self.addNewImageButton.frame.size.height
//                self.imageCollectionView.frame.size.height = self.addNewImageButton.frame.origin.y - self.segBackView.frame.maxY
//                
//            }else{
////                self.addNewImageButton.frame.origin.y = SCREEN.HEIGHT
////                self.imageCollectionView.frame.size.height = SCREEN.HEIGHT - self.segBackView.frame.maxY
//                
//                self.addNewImageButton.frame.origin.y = self.bottomView.frame.minY
//                self.imageCollectionView.frame.size.height = self.bottomView.frame.minY - self.segBackView.frame.maxY
//            }
//        }) { (fi) in
//
//        }
//        
//        
//    }
//    
//}
//
//
//
//extension PhotoListViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
//        
//        if let getImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            if let resizedImage = getImage.resizeForWeb() {
//                guard let imageData = resizedImage.pngData() else { return print("make png fail") }
//                let imageString = imageData.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithLineFeed)
//                
//                let _ = Server.postData(urlString: "https://ezv.kr:4447/voting/php/photo/photo_upload.php", otherInfo: ["img":imageString,"code":code,"deviceid":deviceID]) { (kData : Data?) in
//                    if let data = kData {
//                        print("sendPhoto : \(String(describing: data.toString()))")
//                        self.photoMenuListUpdate(index: self.currentIndex)
//                    }
//                }
//                
//            }
//            
//        }
//        
//
//        
//        picker.dismiss(animated: true) { }
//    }
//    
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
//        picker.dismiss(animated: true) { }
//    }
//}
//
//extension PhotoListViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PhotoCollectionViewCellDelegate {
//    
//    //PhotoCollectionViewCellDelegate
//    func photoCollectionViewCelldidHeartButtonSelected(index: Int) {
//        print("\(index) selected")
//       
//        if index >= self.dataArray.count { return }
//        
//        var dataDic = self.dataArray[index]
//            
//        var nextValue = 0
//        
//        guard let sid = dataDic["sid"] as? String else { return print("sid is nil") }
//        guard let myfav = dataDic["myfav"] as? String else { return print("myfav is nil")}
//        
//        guard let myfavValue = Int(myfav, radix: 10) else { return print("10진수 변환 실패") }
//        if myfavValue == 0 { nextValue = 1}
//        if myfavValue == 1 { nextValue = 0}
//        
//        let urlString = "https://ezv.kr:4447/voting/php/photo/set_favor.php?sid=\(sid)&deviceid=\(deviceID)&val=\(nextValue)"
////        print("set urlString \(urlString)")
//        let _ = Server.postData(urlString: urlString, otherInfo: [:]) { (kData : Data?) in
//            if let data = kData {
//                if let afterCnt = data.toString() {
//                    dataDic["cnt"] = afterCnt
//                    dataDic["myfav"] = myfavValue == 1 ? "0":"1"
//                    self.dataArray[index] = dataDic
//                    self.imageCollectionView.reloadData()
//                }
////                self.photoMenuListUpdate(index: self.currentIndex)
//            }
//        }
//        
//    }
//    
//    
//    //UICollectionViewDataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.collectionViewLayout.numberOfitem
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell : PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
//        
//        cell.index = indexPath.row
//        cell.delegate = self
//        
//        if let cnt = dataArray[indexPath.row]["cnt"] as? String {
//            if let cnt_Int = Int(cnt, radix: 10) {
//                cell.numberOfLike = cnt_Int
//            }
//        }
//        
//        if let fileURL = dataArray[indexPath.row]["url"] as? String {
//            OperationQueue.main.addOperation {
//                cell.photoImageView.sd_setImage(with: URL(string: "https://ezv.kr:4447/voting/upload/photo/\(fileURL)"), completed: nil)
//            }
//        }else{
//            cell.photoImageView.image = nil
//        }
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        let photoBaseVC = PhotoPopUpBaseViewController()
//        photoBaseVC.photoInfos = self.dataArray
//        photoBaseVC.startIndex = indexPath.row
//        let naviCon = RotatableNavigationController(rootViewController: photoBaseVC)
//        naviCon.modalPresentationStyle = .fullScreen
//        self.present(naviCon, animated: true) { }
//        
//        
//        
//    }
//    
//}
//
//@objc protocol PhotoCollectionViewCellDelegate {
//    @objc optional func photoCollectionViewCelldidHeartButtonSelected( index : Int )
//}
//
//
//class PhotoCollectionViewCell: UICollectionViewCell {
//    
//    var delegate : PhotoCollectionViewCellDelegate?
//    
//    var defalultImageView : UIImageView!
//    var photoImageView : UIImageView!
//    
//    var heartInfoLabelBackView : UIView!
//    var heartImageView : UIImageView!
//    var heartInfoLabel : UILabel!
//    
//    var heartButton : UIButton!
//    
//    lazy var heartInfoLabelHeight : CGFloat = {
//        return self.frame.size.height * 0.15
//    }()
//    
//    var index = 0
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.frame.size = PhotoCollectionViewLayout().photoSize
//        
//        self.uiSetting()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func uiSetting() {
//        
//        self.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        self.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
//        self.layer.borderWidth = 1
//        
//        defalultImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width * 0.8, height: 0))
//        defalultImageView.setImageWithFrameHeight(image: UIImage(named: "logo"))
//        defalultImageView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
//        self.addSubview(defalultImageView)
//        
//        photoImageView = UIImageView(frame: self.bounds)
//        photoImageView.contentMode = .scaleAspectFill
//        photoImageView.clipsToBounds = true
//        self.addSubview(photoImageView)
//        
//        heartInfoLabelBackView = UIView(frame: CGRect(x: 0, y: self.frame.size.height - (heartInfoLabelHeight * 2), width: self.frame.size.width, height: heartInfoLabelHeight * 2))
//        heartInfoLabelBackView.setGradientBackgroundColor(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
//        self.addSubview(heartInfoLabelBackView)
//        
//        heartImageView = UIImageView(frame: CGRect(x: 15, y: 0, width: heartInfoLabelHeight, height: heartInfoLabelHeight))
//        heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1), size: heartImageView.frame.size)
//        self.addSubview(heartImageView)
//        
//        heartButton = UIButton(frame: CGRect(x: 15, y: 0, width: heartInfoLabelHeight * 1.5, height: heartInfoLabelHeight * 1.5))
//        heartButton.addTarget(self , action: #selector(heartButtonPressed), for: .touchUpInside)
//        self.addSubview(heartButton)
//        
//        heartInfoLabel = UILabel(frame: CGRect(x: heartImageView.frame.maxX + 3, y: self.frame.size.height - (heartInfoLabelHeight * 1.5), width: self.frame.size.width - (heartImageView.frame.maxX + 3), height: heartInfoLabelHeight))
//        heartInfoLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: heartInfoLabelHeight * 0.9)
//        heartInfoLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        self.addSubview(heartInfoLabel)
//        
//        heartImageView.center.y = heartInfoLabel.center.y
//        heartButton.center = heartImageView.center
//        
//        
//        
//    }
//    
//    @objc func heartButtonPressed(){
//        print("heartButtonPressed : \(self.index)")
//        self.delegate?.photoCollectionViewCelldidHeartButtonSelected?(index: self.index)
//    }
//    
//    var numberOfLike : Int = 0 {
//        willSet(newNumberOfLike){
//            
//            if newNumberOfLike != 0 {
//                heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.solid, textColor: #colorLiteral(red: 0.9450980392, green: 0.05882352941, blue: 0.3725490196, alpha: 1), size: heartImageView.frame.size)
//            }else{
//                heartImageView.image = UIImage.fontAwesomeIcon(name: .heart, style: FontAwesomeStyle.regular, textColor: #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1), size: heartImageView.frame.size)
//            }
//            
//            heartInfoLabel.text = "\(newNumberOfLike)"
//        }
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.photoImageView.sd_cancelCurrentImageLoad()
//    }
//}
//
//
//
//
//class PhotoListSelectButton: UIButton {
//    
//    override var isSelected: Bool {
//        willSet(newIsSelected){
//            if newIsSelected {
//                self.backgroundColor = #colorLiteral(red: 0.6470588235, green: 0.7647058824, blue: 0.1529411765, alpha: 1)
//                self.nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            }else{
//                self.backgroundColor = UIColor.clear
//                self.nameLabel.textColor = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
//            }
//            
//        }
//    }
//    
//    var nameLabel : UILabel!
//    init(frame: CGRect, name : String) {
//        super.init(frame: frame)
//        
//        nameLabel = UILabel(frame: self.bounds)
//        nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: nameLabel.height * 0.3)
//        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        nameLabel.numberOfLines = 0
//        nameLabel.textAlignment = .center
//        nameLabel.text = name
//        self.addSubview(nameLabel)
//        
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//
//
//
//class AddNewImageButtonBackView: UIView {
//    
//    var iconImageView : UIImageView!
//    var nameLabel : UILabel!
//    
//    init(frame: CGRect, name kName : String) {
//        super.init(frame: frame)
//        
//        self.isUserInteractionEnabled = false
//        
//        let innerView = UIView(frame: self.bounds)
//        self.addSubview(innerView)
//        
//        iconImageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height * 0.5, height: self.frame.size.height * 0.5))
//        iconImageView.image = UIImage.fontAwesomeIcon(name: .camera, style: .solid, textColor: UIColor.white, size: iconImageView.frame.size)
//        iconImageView.center.y = self.frame.size.height / 2
//        iconImageView.isUserInteractionEnabled = false
//        innerView.addSubview(iconImageView)
//        
//        nameLabel = UILabel(frame: CGRect(x: iconImageView.frame.maxX + 10, y: 0, width: 100, height: self.frame.size.height))
//        nameLabel.numberOfLines = 0
//        nameLabel.textAlignment = .center
//        nameLabel.text = kName
//        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 20)
//        nameLabel.sizeToFit()
//        nameLabel.center.y = self.frame.size.height / 2
//        nameLabel.isUserInteractionEnabled = false
//        innerView.addSubview(nameLabel)
//        
//        innerView.frame.size.width = nameLabel.frame.maxX
//        innerView.center.x = self.frame.size.width / 2
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//func resize(image: UIImage, complete: @escaping ( (_ image : UIImage?) -> Void))
//{
//    
//    let maxSize = max(image.size.width, image.size.height)
//    let scale = 720 / maxSize
//    
//    let transform = CGAffineTransform(scaleX: scale, y: scale)
//    let size = image.size.applying(transform)
//    UIGraphicsBeginImageContext(size)
//    image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//    let afterImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    
//    complete(afterImage)
//    
//}
