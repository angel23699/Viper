//
//  HomeRemoteDataManager.swift
//  TableWithVIPER
//
//  Created by Angel Arce on 07/06/21.
//  
//

import Foundation

class HomeRemoteDataManager: HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func externalGetData() {
        // LLAMAR AL SERVICIO Y OBTENER LOS DATOS
        
        // LLAMAR AL SERVIDOR Y TRAER LOS DATOS
        let session = URLSession.shared
        // CREAMOS LA PETICION URL
        var request = URLRequest(url: URL(string: Endpoint.getData)!)
        // ASIGNAMOS EL VERBO DEL SERVICIO
        //request.httpMethod = "GET"
        // CONFUGURAMOS LOS HEADERS
        //request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        // ENVIAR UN JSON POR POST
        //request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        // HACEMOS LA PETICIÓN
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            // GESTIONAMOS LO QUE HEMOS RECIBIDO, CONVERTIMOS EL RESPONSE EN UN OBJETO HTTPURLResponse PARA GESTIONAR EL CÓDIGO DE RESPUESTA DEL SERVIDOR
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
                print("Ha habido un error en la conexión: \(error!)")
                return
            }
            
            //print("Traemos del server: \(String(describing: String(data: data, encoding: .utf8)!))")
            
            // COMPROBAMOS EL CÓDIGO DEL SERVIDOR
            if [200].contains(respuesta.statusCode) {
                // AQUÍ YA HEMOS VALIDADO QUE LA CONEXIÓN ES CORRECTA Y EL SERVIDOR RESPONDIO 200
                
                do {
                    let decoder = JSONDecoder()
                    let categories = try decoder.decode([CategoryURL].self, from: data)
                    
                    // ENVIAR DE VUELTA LOS DATOS AL INTERACTOR
                    self.remoteRequestHandler?.remoteDataManagerCallbackData(with: categories)
                } catch {
                    print("No se ha podido parsear el arhivo, error: \(error.localizedDescription)")
                }
            } else {
                print("Ha habido un error: \(respuesta.statusCode)")
            }
        }.resume()
    }
}
