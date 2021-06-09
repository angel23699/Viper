//
//  HomeInteractor.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    func interactorGetData() {
        // DECIRLE A LA CAPA DE CONEXION (EXTERNAL DATA MANAGER) QUE TIENE QUE TRAER UNOS DATOS
        remoteDatamanager?.externalGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // implement RemoteDataManager output methods
    func remoteDataManagerCallbackData(with categories: [CategoryURL]) {
        // EL INTERACTOR DEBE DE ENVIARLE LOS DATOS AL PRESENTER
        // SI TENEMOS BASURA EN NUESTROS MODELOS, AQUÍ PODEMOS LIMPIAR, PARA SOLO PASAR LA INFO QUE SE REQUIERE
        // TODA LA LOGICA DEBE DE IR EN EL INTERACTOR - TODA!
        
        //print("Estoy obteniendo estos datos: \(categories)")
        
        // PASARLE LOS DATOS AL PRESENTER
        presenter?.interactorPushDataPresenter(receivedData: categories)
    }
}
