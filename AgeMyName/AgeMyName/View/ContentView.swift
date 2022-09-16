//
//  ContentView.swift
//  AgeMyName
//
//  Created by Ananya Garg on 9/15/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var name: String = ""
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.cyan, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                EnterName(name: $name)
                    .padding()
                GetAge(inputName: name)
                    .padding()
                DisplayAge()
                    .padding()
                
            }
            
        }
        
       
  
        
        
    }
}
struct EnterName: View{
    @EnvironmentObject var viewModel: ViewModel
    @Binding var name: String
    var body: some View{
        
        Group{
            
            TextField("Enter Name", text: $name)
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

struct GetAge: View{
    @EnvironmentObject var viewModel: ViewModel
    let inputName: String
    var body: some View{
        Button("Get Age"){
            Task{
                await viewModel.getMyAge(inputName: inputName)
            }
        }
        .alert("No Spaces :)", isPresented: $viewModel.spacedEntered){
            Button("Got it.", role:.cancel){}
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 50, alignment: .center)
        .font(.system(size: 30))
        .padding()
        .background(
            LinearGradient(colors: [.pink, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing
                          )
            
            )
        .cornerRadius(15)
    }
}



struct DisplayAge: View{
    @EnvironmentObject var viewModel: ViewModel
    var body: some View{
        Text(String(viewModel.outPut))
            .foregroundColor(.white)
            .font(.system(size: 40))
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

