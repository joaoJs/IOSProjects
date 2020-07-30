//
//  SceneDelegate.swift
//  Programmatic
//
//  Created by Joao Campos on 7/28/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // UIResponder --> event handling backbone of a UIKit app
    // UIWindowSceneDelegate --> Additional methods that you use to manage app-specific tasks occurring in a scene.

    var window: UIWindow?
    
    // UIWindow --> The backdrop for your app’s user interface and the object that dispatches events to your views. backdrop (pano de fundo)


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // UIScene --> An object that represents one instance of your app's user interface.
        // UISceneSession --> Object that represents instance of one of your apps' scene
        // what are the connection options?
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // UIWindowScene --> specific schene that return one or more windows for your app

        
        self.window = UIWindow(frame: UIScreen.main.bounds) // UIScreen --> object that has data associated with a hardware-based display
        self.window?.windowScene = windowScene
        
        let navVC = UINavigationController() //A container view controller that defines a stack-based scheme for navigating hierarchical content.
        // UINavigationController() --> container / stack-based scheme / navigating hierarchical content
        let vc = TableViewController()
        //TableViewController --> My view controller, I will push it to the navigation view controller
        navVC.pushViewController(vc, animated: false)
        
        
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        // makeKeyAndVisible --> make key??
    }

}

