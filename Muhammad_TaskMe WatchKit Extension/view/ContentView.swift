//
//  ContentView.swift
//  Muhammad_TaskMe WatchKit Extension
//
//  Created by MUS on 2020-12-11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskViewModel = TaskViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
                if (taskViewModel.taskList.count != 0){

                    VStack(alignment: .leading, spacing: 30){

                        HStack{
                            Text(self.taskViewModel.taskList[0].activity ?? "No activity found")
                              
                                .foregroundColor(Color.yellow)
                        }

                        
                        

                    }
                    
                //}
                
            }else{
                Text("No activity data. Try pressing the button below")
                
            }
                
                Button(action: {
                    taskViewModel.fetchDataFromAPI()
                    

                }) {
                    Text("Suggest me an activity")
                        .accentColor(Color.green)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }


          }
            .navigationBarTitle(Text("Muhammad Usman Shahid"))
            //end of body
        }.onAppear(){
            
            taskViewModel.fetchDataFromAPI()
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
