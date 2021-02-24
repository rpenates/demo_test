//
//  PersonViewModel.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import Foundation
import Alamofire

class PersonViewModel: ObservableObject {
    let apiUrl: String
    static let instance = PersonViewModel()
    @Published var currentPerson = Person()
    @Published var isLoading = false
    
    private init() {
        apiUrl = "https://run.mocky.io/v3/50737492-be94-4420-b6ce-ec03be3f77cf"
    }
    
    func sendData() {
        self.isLoading = true
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(currentPerson)
            let jsonEncodedData = String(data: jsonData, encoding: .utf8)!
            print("[Network]  json payload: \(jsonEncodedData)")
            
            AF.request(apiUrl, method: .post, parameters: jsonEncodedData, encoder: JSONParameterEncoder.default).responseJSON { (response) in
                print("Request response: \(response)")
                switch response.result {
                    case.success(let successResponse):
                        self.isLoading = false
                        print("Success...")
                    case.failure(let afError):
                        print("AF error con: \(afError)")
                }
            }
            
            
            
        } catch let error as NSError {
            print("request failure with: \(error)")
        }
    }
    
    
}
