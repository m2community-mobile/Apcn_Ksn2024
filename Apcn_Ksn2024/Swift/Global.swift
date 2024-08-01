import Foundation

//let code = "KSCCM2023"
//let code = "korl2023"


//let code = "apcn2024"
let code = "apcn_app"


let REGIST_SID = "REGIST_SID"
var regist_sid : String {
    get{
        if let value = userD.object(forKey: REGIST_SID) as? String {
            return value
        }else{
            return ""
        }
    }
}

var isLogin : Bool {
    print("user_sid:\(regist_sid)")
    return !regist_sid.isEmpty
}

var boothEvent : String {
    get{
        return "https://ezv.kr:4447/voting/php/booth/event.php?code=\(code)&user_sid=\(regist_sid)&barcode=\(regist_sid)&include=Y"
    }
}

let QUESTION_URL = "https://ezv.kr:4447/voting/php/question/post.php"

struct URL_KEY {

    static let BASE_URL = "ezv.kr"
    static let EZV_URL = "aocc2023"

//    static let day_1 = "https://ezv.kr:4447/voting/php/session/list.php?tab=577&code=\(code)&deviceid=\(deviceID)"
    static let day_1 = "http://ezv.kr/voting/php/session/list.php?code=\(code)&deviceid=\(deviceID)"
    

    
    
    static let day_2 = "https://ezv.kr:4447/voting/php/session/list.php?tab=578&code=\(code)&deviceid=\(deviceID)"
    static let day_3 = "https://ezv.kr:4447/voting/php/session/list.php?tab=579&code=\(code)&deviceid=\(deviceID)"
    static let day_4 = "https://ezv.kr:4447/voting/php/session/list.php?tab=580&code=\(code)&deviceid=\(deviceID)"
    static let now = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-1"
    static let session = "https://ezv.kr:4447/voting/php/session/category.php?code=\(code)"
//    static let today = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)"
    
    
    static let today = "https://ezv.kr:4447/voting/php/session/list.php?code=KSCCM2024"
    
    
    
    static let speakers = "https://ezv.kr:4447/voting/php/faculty/list.php?code=\(code)&deviceid=\(deviceID)"
    static let sponsors = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"
    static let exihibition = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)&tab=2"
    
    static let mySchedule = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-2"
    static let search = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-3"
    static let memo = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-6"
    
    
    static let noticeList = "https://ezv.kr:4447/voting/php/bbs/list.php?code=\(code)"
    static let noticeView = "https://ezv.kr:4447/voting/php/bbs/view.php?code=\(code)"
    
    static let Abstract = "https://ezv.kr:4447/voting/php/abstract/category.php?code=\(code)&deviceid=\(deviceID)"
    
//    static let Survey = "http://virtual.icksh.org/main_survey.asp"
//    static let Survey = "http://virtual.icksh.org/survey.asp"
    static let Survey = "http://ezv.kr/voting/php/feedback/view.php?code=\(code)"
    
    
  
    
    static let Program_Introduction = "http://ezv.kr/apcn2024/html/program/introduction.html"
    static let Official_Social_Program = "http://ezv.kr/apcn2024/html/program/programs.html"

    /**
     1. Congress Information
         Welcome Message
         Overview
         Organizing Committee
         Relevant Organization
         Contact us
     2. Program
         Program at a glance
         April 27 (Thu)
         April 28 (Fri)
         KSCCM-JSICM Joint Session
         Workshop
         Luncheon Symposium
         My Schedule
         Now
     3. Abstract
     4. Invited Speakers
     5. Award
     6. E-Poster
     7. Voting
     8. Survey
     9. Sponsors
         Sponsors
         Exhibition Floor Plan
     10. About Venue
         About Venue
         Floor Plan
         Transportation
     11. Booth Stamp Event
     12. Notice
     */
    
    ////
    
//    static let Welcome_Message = "https://ezv.kr:4447/ksccm2023/html/contents/welcome.html"
    
    static let Welcome_Message = "http://ezv.kr/apcn2024/html/about/invitation.html"
    
    
//    static let Overview = "https://ezv.kr:4447/ksccm2023/html/contents/overview.html"
    static let Overview = "http://ezv.kr/apcn2024/html/about/overview.html"
    
    
//    static let Organizing_Committee = "https://ezv.kr:4447/ksccm2023/html/contents/committee.html"
    static let Organizing_Committee = "http://ezv.kr/apcn2024/html/about/organization.html"
    
    static let about = "http://ezv.kr/apcn2024/html/about/about.html"
    
    
    static let About_Venue = "http://ezv.kr/apcn2024/html/venue/index.html"
    static let Transportation = "http://ezv.kr/apcn2024/html/venue/transportation.html"
    static let TransportationKor = "http://ezv.kr/apcn2024/html/venue/transportationKor.html"
    static let Floor = "http://ezv.kr/apcn2024/html/venue/floor.html"
    
    
    
    static let Relevant_Organization = "https://ezv.kr:4447/ksccm2023/html/contents/relevant.html"
    static let Contact_us = "https://ezv.kr:4447/ksccm2023/html/contents/contact.html"
    
    static let KSCCM_JSICM_Joint_Session = "https://ezv.kr:4447/ksccm2023/html/contents/jointSession.html"
    static let Workshop = "https://ezv.kr:4447/ksccm2023/html/contents/workshop_01.html"
    static let Luncheon_Symposium = "https://ezv.kr:4447/ksccm2023/html/contents/luncheon.html"

//    static let Award = "https://ezv.kr:4447/ksccm2023/html/contents/award.html"
//    static let E_Poster = "https://ezv.kr:4447/ksccm2023/html/eposter/index.html"


    static let Sponsors = "https://ezv.kr:4447/voting/php/booth/list.php?code=KSCCM2023"
//    static let Exhibition_Floor_Plan = "https://ezv.kr:4447/ksccm2023/html/contents/exhibition.html"
    static let Exhibition_Floor_Plan          = "http://ezv.kr/apcn2024/html/sponsor/exhibition.html"
    
//    static let About_Venue = "https://ezv.kr:4447/ksccm2023/html/contents/venue.html"
    static let Floor_Plan = "https://ezv.kr:4447/ksccm2023/html/contents/floor.html"
//    static let Transportation = "https://ezv.kr:4447/ksccm2023/html/contents/transportation.html"

//    static let Sponsor          = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"
    static let Sponsor          = "http://ezv.kr/apcn2024/html/sponsor/sponsors.html"
//    static let Exhibition_Floor_Plan          = "http://ezv.kr/apcn2024/html/sponsor/exhibition.html"
    

 
    static let Travel          = "http://ezv.kr/apcn2024/html/sub/travel.html"
    
    
    static let SendQuestions = "http://ezv.kr/apcn2024/html/sub/question.html?deviceid=\(deviceID)"
    

}

var E_Poster : String {
    get {
        return "https://ezv.kr:4447/ksccm2023/html/eposter/index.html?regist_sid=\(regist_sid)&deviceid=\(deviceID)"
    }
}

struct INFO {
    
    
    
    struct KEY {
        static let TITLE = "TITLE"
        static let SUB_MENU = "SUB_MENU"
        
        static let URL = "URL"
        
        static let IS_REQUIRED_LOGIN = "IS_REQUIRED_LOGIN"
        
        static let IS_PHOTO_GALLERY = "IS_PHOTO_GALLERY"
        
      
        
        static let PhotoListViewControllerTest1 = "PhotoListViewControllerTest1"
        static let IS_PHOTO_GALLERYIndex1 = "IS_PHOTO_GALLERYIndex1"
        
        static let IS_PROGRAM_AT_A_GLANCE = "IS_PROGRAM_AT_A_GLANCE"
        
        static let IS_VOTING = "IS_VOTING"
        static let IS_POPUP = "IS_POPUP"
        static let IS_OPEN_SAFARI = "IS_OPEN_SAFARI"
        
        //etc
        static let IS_BOOTH_EVENT = "IS_BOOTH_EVENT"
        static let IS_E_POSTER = "IS_E_POSTER"
        
    }
    
    
    static let MAIN_INFO =
        [
            [KEY.TITLE : "",KEY.URL:URL_KEY.Welcome_Message],
//            [KEY.TITLE : "Program",KEY.URL:URL_KEY.today],
//            [KEY.TITLE:"Program",KEY.IS_PROGRAM_AT_A_GLANCE:KEY.IS_PROGRAM_AT_A_GLANCE],
            [KEY.TITLE:"Program",KEY.URL:URL_KEY.day_1],
            
            
            
            [KEY.TITLE : "Abstract",KEY.URL:URL_KEY.Abstract],
//            [KEY.TITLE : "Invited\nSpeakers",KEY.URL:URL_KEY.speakers],
            [KEY.TITLE : "Invited Guest",KEY.URL:URL_KEY.speakers],
            [KEY.TITLE : "About Venue",KEY.URL:URL_KEY.About_Venue],
            [KEY.TITLE : "Sponsors",KEY.URL:URL_KEY.Sponsor],
            [KEY.TITLE : "Photo Gallery",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
            [KEY.TITLE : "Send Questions\nto Speaker",KEY.URL:URL_KEY.SendQuestions],
            [KEY.TITLE : "Notice",KEY.URL:URL_KEY.noticeList],
            
    ]
    /**
     1. Congress Information
         Welcome Message
         Overview
         Organizing Committee
         Relevant Organization
         Contact us
     2. Program
         Program at a glance
         April 27 (Thu)
         April 28 (Fri)
         KSCCM-JSICM Joint Session
         Workshop
         Luncheon Symposium
         My Schedule
         Now
     3. Abstract
     4. Invited Speakers
     5. Award
     6. E-Poster
     7. Voting
     8. Survey
     9. Sponsors
         Sponsors
         Exhibition Floor Plan
     10. About Venue
         About Venue
         Floor Plan
         Transportation
     11. Booth Stamp Event
     12. Notice
     */
    static let INFOS =
        [       
            [
                KEY.TITLE : "APCN & KSN 2024",
                KEY.SUB_MENU :
                    [
                        [KEY.TITLE:"Invitation",KEY.URL:URL_KEY.Welcome_Message],
                        [KEY.TITLE:"Congress Overview",KEY.URL:URL_KEY.Overview],
                        [KEY.TITLE:"Organization",KEY.URL:URL_KEY.Organizing_Committee],
                        [KEY.TITLE:"About",KEY.URL:URL_KEY.about],
//                        [KEY.TITLE:"Contact us",KEY.URL:URL_KEY.Contact_us],
                ]
            ],
//            [KEY.TITLE : "About Venue",KEY.URL:URL_KEY.Abstract],
            [
                KEY.TITLE : "About Venue",
                KEY.SUB_MENU :
                    [
                        [KEY.TITLE:"About Venue",KEY.URL:URL_KEY.About_Venue],
                        [KEY.TITLE:"Transportation (for Foreigners)",KEY.URL:URL_KEY.Transportation],
                        [KEY.TITLE:"Transportation (for Koreans)",KEY.URL:URL_KEY.TransportationKor],
                        [KEY.TITLE:"Floor Plan",KEY.URL:URL_KEY.Floor]
                        ]
            ],
            
            
            
            [
                KEY.TITLE : "Program",
                KEY.SUB_MENU :
                    [
                        [KEY.TITLE:"Program at a glance",KEY.IS_PROGRAM_AT_A_GLANCE:KEY.IS_PROGRAM_AT_A_GLANCE],
                        [KEY.TITLE:"June 13 (Thu)",KEY.URL:URL_KEY.day_1],
                        [KEY.TITLE:"June 14 (Fri)",KEY.URL:URL_KEY.day_2],
                        [KEY.TITLE:"June 15 (Sat)",KEY.URL:URL_KEY.day_3],
                        [KEY.TITLE:"June 16 (Sun)",KEY.URL:URL_KEY.day_4],
                        [KEY.TITLE:"My Schedule",KEY.URL:URL_KEY.mySchedule],
                        [KEY.TITLE:"Now",KEY.URL:URL_KEY.mySchedule],
                        [KEY.TITLE:"Program Introduction",KEY.URL:URL_KEY.Program_Introduction],
                        [KEY.TITLE:"Official & Social Program",KEY.URL:URL_KEY.Official_Social_Program]
//                        [KEY.TITLE:"Now",KEY.URL:URL_KEY.now],
                ]
            ],
            [KEY.TITLE : "Abstract",KEY.URL:URL_KEY.Abstract],
            [KEY.TITLE : "Invited Guest",KEY.URL:URL_KEY.speakers],
            [KEY.TITLE : "Travel Information",KEY.URL:URL_KEY.Travel],
            
            
//            [KEY.TITLE : "Sponsors",KEY.URL:URL_KEY.Sponsor],
            [KEY.TITLE : "Sponsors",
             KEY.SUB_MENU :
                [
                    [KEY.TITLE : "Sponsors",KEY.URL:URL_KEY.Sponsor],
                    [KEY.TITLE : "Exhibition Floor Plan",KEY.URL:URL_KEY.Exhibition_Floor_Plan],
            ]
             
            ],
            
            
            
//            [KEY.TITLE : "Photo Gallery",KEY.IS_VOTING:KEY.IS_VOTING],
//            [KEY.TITLE : "Photo Gallery",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
           
            
            [KEY.TITLE : "Photo Gallery",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
            
//            [KEY.TITLE : "Photo Gallery",
//             KEY.SUB_MENU :
//                [
////                    [KEY.TITLE : "June 13 (Thu)",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//                    [KEY.TITLE : "June 13 (Thu)",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//                    [KEY.TITLE : "June 14 (Fri)",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//                    [KEY.TITLE : "June 15 (Sat)",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//                    [KEY.TITLE : "June 16 (Sun)",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//                    [KEY.TITLE : "Share Your Moments",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//            ]
//             
//            ],
            
            
            
//            [KEY.TITLE : "Booth Stamp Event",KEY.URL:URL_KEY.Survey],
            
//            [
//                KEY.TITLE : "Sponsors",
//                KEY.SUB_MENU :
//                    [
//                        [KEY.TITLE:"Sponsors",KEY.URL:URL_KEY.Sponsors],
//                        [KEY.TITLE:"Exhibition Floor Plan",KEY.URL:URL_KEY.Exhibition_Floor_Plan],
//                ]
//            ],
//            [
//                KEY.TITLE : "About Venue",
//                KEY.SUB_MENU :
//                    [
//                        [KEY.TITLE:"About Venue",KEY.URL:URL_KEY.About_Venue],
//                        [KEY.TITLE:"Floor Plan",KEY.URL:URL_KEY.Floor_Plan],
//                        [KEY.TITLE:"Transportation",KEY.URL:URL_KEY.Transportation],
//                ]
//            ],
//            [
//                KEY.TITLE : "Booth Stamp Event",
//                KEY.IS_BOOTH_EVENT : KEY.IS_BOOTH_EVENT,
//            ],
            [
                KEY.TITLE : "Notice",
                KEY.URL:URL_KEY.noticeList
            ],
//            [
//                KEY.TITLE : "My Schedule",
//                KEY.SUB_MENU :
//                    [
//                        [KEY.TITLE:"My Schedule",KEY.URL:URL_KEY.mySchedule],
//                        [KEY.TITLE:"My Memo",KEY.URL:URL_KEY.memo],
//                ]
//            ],
                
    ]
}
