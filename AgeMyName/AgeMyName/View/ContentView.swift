//
//  ContentView.swift
//  AgeMyName
//
//  Created by Ananya Garg on 9/15/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var name: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.cyan, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                EnterName(name: name)
                    .padding()
                DisplayAge()
                    .padding()
                
            }
            
        }
        
       
  
        
        
    }
}
struct EnterName: View{
    @EnvironmentObject var viewModel: ViewModel
    @State var name: String

    
    var body: some View{
        
        Group{
            TextField("Enter Name", text: $name)
                .onChange(of: name) { newName in
                    Task{
                        await viewModel.getMyAge(inputName: name)
                        
                    }
                    
                }
                .alert("No Spaces :)", isPresented: $viewModel.spacedEntered){
                            Button("Got it.", role:.cancel){}
                        }
                .foregroundColor(.white)
                .font(.system(size: 40))
                .frame(width: 250, height: 100, alignment: .center)
                .padding()
                .background(
                    Color.pink
                    )
                .cornerRadius(15)
            
        }
    }
}





struct DisplayAge: View{
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View{
        Text("You are " + String(viewModel.outPut) + " years old.")
            .foregroundColor(.white)
            .font(.system(size: 30))
            .padding()
            .background(
                LinearGradient(colors: [.pink, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing
                              )
                
                )
            .background(Color.cyan)
            .cornerRadius(15)
        Text("You share a name with " + String(viewModel.nameCount) + " people!")
            .foregroundColor(.white)
            .font(.system(size: 30))
            .padding()
            .background(
                LinearGradient(colors: [.pink, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing
                              )
                
                )
            .background(Color.cyan)
            .cornerRadius(15)
        
    }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
            .preferredColorScheme(.light)
    }
    }

