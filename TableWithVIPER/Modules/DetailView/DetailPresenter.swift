//
//  DetailPresenter.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 08/06/21.
//  
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    // MARK: Properties - DetailPresenterProtocol
    var categoriaRecebida: CategoryURL?
}

extension DetailPresenter: DetailPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("Hola, soy la vista detalle y tengo los el dato: \(String(describing: categoriaRecebida))")
        
        if let datoRecibido = categoriaRecebida {
            view?.showDataInLabel(data: datoRecibido)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
