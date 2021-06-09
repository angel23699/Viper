//
//  HomePresenter.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        
        // DECIRLE AL INTERACTOR QUE QUIERE TRAER UNOS DATOS
        interactor?.interactorGetData()
        
        // MOSTRAMOS EL INDICADOR DE CARGA
        view?.cargarActivityIndicator()
    }
    
    func showDetailView(withData: CategoryURL) {
        // VAMOS A LLAMAR AL WIREFRAME
        wireFrame?.presentNewViewDetail(from: view!, withData: withData)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // implement interactor output methods
    func interactorPushDataPresenter(receivedData: [CategoryURL]) {
        // LE DECIMOS A LA VISTA QUE PINTE LOS DATOS
        view?.presenterPushDataView(receivedData: receivedData)
        view?.stopAndHideActivityIndicator()
    }
}
