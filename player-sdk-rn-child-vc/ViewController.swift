//
//  ViewController.swift
//  player-sdk-rn-child-vc
//
//  Created by Mobile Team on 07/02/2022.
//

import UIKit
import TBXPlayerSDK

let contentID = "61d35ee0a4cc292e2f37eabb"
let token = "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJUb29sYm94IERpZ2l0YWwgU0EiLCJhdWQiOiJ1bml0eS50YnhhcGlzLmNvbSIsImlhdCI6MTY0NjY4MDIxNywiZXhwIjoxNjQ2ODUzMDE3LCJjb3VudHJ5IjoiTVgiLCJsYW5ndWFnZSI6ImVzIiwiY2xpZW50IjoiM2ExYTA3MzY0MDkxZTdhZDU3ODgxMzNhYWYyNjBmYWEiLCJkZXZpY2UiOiJjZmYzNzI5OTlkMGE5ODc5MTA4ZDgxOWM3ZTJlZDAwODVmZTI1YzMyIiwic3Vic2NyaWJlciI6IjEwMDAwMDI3MyIsImluZGV4IjoiNTg2ZDEyNzhkMWVhNTgwY2Q3NjNmNGZmIiwiY3VzdG9tZXIiOiI1NTY3NWVlNmRlY2NmZWFjMzNkMDU3MmIiLCJwcm9maWxlIjoiNjE1Yzk5MTdlYTE5MGYxNDAwMWVkZjVkIiwibWF4UmF0aW5nIjoyfQ.VTNY0rsMAx6toLv37VKbx7Z8n97rM99eUHlN4BujgzM"

let contentID2 = "61804531a4cc292e2f2e39a5"
let networkID = "discoverykids"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TBXPlayerManager.shared.restorePlayerEmbedded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        TBXPlayerManager.shared.removePlayerEmbedded()
    }
    
    @IBOutlet weak var playerContainerView: UIView!
    
    @IBAction func play(_ sender: Any) {
        let builder = PlaybackBuilder(
                    contentID: contentID,
                    authorization: .JWT,
                    token: token,
                    env: nil,
                    profileID: "61b8e71add695014007fd753",
                    containerView: playerContainerView)
        
//        TBXPlayerManager.shared.preparePlayer(
//            builder, with: self,
//            on: AppUtility.getTopController())
        
        TBXPlayerManager.shared.preparePlayer(builder, with: getTopController(), on: self, containerView: playerContainerView)
        
        TBXPlayerManager.shared.startPlayer()
    }
    
    @IBAction func changeMediaSource(_ sender: Any) {
        TBXPlayerManager.shared.changeMediaSource(
            ["contentId": contentID2])
    }
}

func getTopController() -> UIViewController {
    if var topController = UIApplication.shared.keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    return UIViewController()
}

