//
//  HomeWireFrame.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    class func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentNewViewDetail(from view: HomeViewProtocol, withData: CategoryURL) {
        // CREAR NUEVO MODULO E INSTANCIARLO
        
        let newDetailView = DetailWireFrame.createDetailModule(withData: withData)
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
}
