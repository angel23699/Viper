//
//  DetailView.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 08/06/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var bienvenidoLabel: UILabel!
    
    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Super detalle"
        
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    
    // implement view output methods
    
    func showDataInLabel(data: CategoryURL) {
        bienvenidoLabel.text = data.name
    }
}
