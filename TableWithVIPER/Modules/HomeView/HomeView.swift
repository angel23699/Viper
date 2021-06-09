//
//  HomeView.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {
    // LA VISTA NO PUEDE NI SIQUIERA ANIMAR UN ACTIVITY INDICATOR, DE ESO SE ENCARGA EL PRESENTER
    // LA VISTA ES TONTA

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var dataSet = [CategoryURL]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comunico a la vista con mi presenter
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationItem.backButtonTitle = ""
    }
}

extension HomeView: HomeViewProtocol {
    
    // implement view output methods
    func presenterPushDataView(receivedData: [CategoryURL]) {
        self.dataSet = receivedData
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func cargarActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopAndHideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
    }
}

// MARK: UITableViewDataSource
extension HomeView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = dataSet[indexPath.row].name
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension HomeView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter?.showDetailView(withData: dataSet[indexPath.row])
    }
}
