//
//  TaskViewModel.swift
//  Muhammad_TaskMe WatchKit Extension
//
//  Created by MUS on 2020-12-11.
//

import Foundation

class TaskViewModel : ObservableObject{
    @Published var taskList = [Task]()
    @Published var boredURLString: String = #"https://www.boredapi.com/api/activity"#

    func fetchDataFromAPI(){

        
        print(#function, "url is \(boredURLString)")
        
        guard let apiURL = URL(string: boredURLString) else{
            return
        }
        
        URLSession.shared.dataTask(with: apiURL){
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let er = error{
                print(#function, "Error \(er.localizedDescription)")
            }else{

                DispatchQueue.global().async {
                    do{
                        if let jsonData = data{

                            
                            let decodedResponse = try JSONDecoder().decode(Task.self, from: jsonData)
                            
                            let decodedList : [Task] = [decodedResponse]
                            
                            DispatchQueue.main.async {
                                self.taskList = decodedList
                                print(#function, self.taskList)
                            }
                            
                            
                        }else{
                            print(#function, "Empty JSON data :(")
                        }
                    }catch let error{
                        print(#function, "Error decoding the data \(error)")
                    }
                }
            }
            
        }.resume()
    }
}
