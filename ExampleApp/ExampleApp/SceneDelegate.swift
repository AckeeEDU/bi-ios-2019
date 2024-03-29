//
//  SceneDelegate.swift
//  ExampleApp
//
//  Created by Jan Misar on 09/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }

        let tabBarVC = UITabBarController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let mapViewController = MapViewController()
        mapViewController.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), selectedImage: nil)
        
        let vc1 = storyboard.instantiateViewController(identifier: "AutolayoutViewController")
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let vc2 = storyboard.instantiateViewController(identifier: "AutolayoutedBubblesVC")
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        let vc3 = storyboard.instantiateViewController(identifier: "ActionNavigationController")
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let scrollVC = ScrollViewController()
        scrollVC.tabBarItem = UITabBarItem(title: "ScrollView", image: UIImage(systemName: "arrow.up.and.down"), selectedImage: nil)
        
        let tableVC = TableViewController()
        tableVC.tabBarItem = UITabBarItem(title: "TableView", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        
        let collectionVC = CollectionViewController()
        collectionVC.tabBarItem = UITabBarItem(title: "CollectionView", image: UIImage(systemName: "table"), selectedImage: nil)
        
        let diffableTableVC = DiffableTableViewController()
        diffableTableVC.tabBarItem = UITabBarItem(title: "Diffable TableView", image: UIImage(systemName: "list.dash"), selectedImage: nil)

        let recipesVC = UINavigationController(rootViewController: RecipesViewController())
        recipesVC.tabBarItem = UITabBarItem(title: "Recipes", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        
        let authorsVC = storyboard.instantiateViewController(identifier: "AuthorsViewController")
        authorsVC.tabBarItem = UITabBarItem(title: "CoreData", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        
        tabBarVC.viewControllers = [recipesVC, mapViewController, vc1, vc2, vc3, scrollVC, tableVC, collectionVC, diffableTableVC, authorsVC]

        let navVC = UINavigationController(rootViewController: tabBarVC)
        navVC.isNavigationBarHidden = true

        let window = UIWindow(windowScene: scene)
        window.rootViewController = navVC
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

