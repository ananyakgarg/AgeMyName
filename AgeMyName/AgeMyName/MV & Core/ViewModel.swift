//
//  ViewModel.swift
//  AgeMyName
//
//  Created by Ananya Garg on 9/15/22.
//


import Foundation

@MainActor class ViewModel: ObservableObject{
    
    
    
    @Published var inputName: String = ""
    @Published var outPut: Int = 0
    @Published var spacedEntered: Bool = false
    
    func getMyAge(inputName: String) async{
        guard let url = URL(string: "https://api.agify.io?name=" + inputName)
        else{
            spacedEntered = true
            print("Invalid URL")
            return
        }
        do{
            let (data, _ ) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try?
                JSONDecoder().decode(Result.self, from: data){
                outPut = decodedResponse.age
            }
        } catch{
            print("Invalid data")
        }
        
        
        
    }
    
}


struct Result: Codable {
    var name: String
    var age: Int
    var count: Int
}

