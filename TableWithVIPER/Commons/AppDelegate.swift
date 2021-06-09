//
//  AppDelegate.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // INICIALIZAR EL MODULO DE VIPER E INICIALIZAR UNA VENTANA CON ESTE VIEWCONTROLLER
        let homeView = HomeWireFrame.createHomeModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()
        
        return true
    }
}
