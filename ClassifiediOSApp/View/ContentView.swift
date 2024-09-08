//
//  ContentView.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel(networkManager: NetworkManager())
    @State var loading:Bool = true
    
    var body: some View {
        NavigationStack{
            ZStack{
                LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                    .frame(width:100, height: 200).padding()
                VStack(spacing:20) {
                    Text("Classified iOS App").font(.system(size: 30, weight:.bold, design:.monospaced))
                        .italic()
                        .foregroundStyle(.black.gradient)
                    
                    List{
                        if viewModel.customError != nil{
                            Text(viewModel.customError?.errorDescription ?? "Something Went Worng")
                        }else{
                            DetailedViewFunc()
                        }
                        
                    }
                    .font(.system(size: 20, weight:.semibold, design:.monospaced))
                    .italic()
                    .foregroundStyle(.black.gradient)
                    
                    .scrollContentBackground(.hidden)
                    
                    
                    
                }
                // This is redacted View which provides a loading kind of experience while the data is fetched.
                .redacted(reason: loading ? .placeholder: [])
                .onAppear(){
                    Task{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            loading = false
                        }
                    }
                    
                }
                
                
                .task{
                    /* This is when combine framework is used */
                    viewModel.getProductsFromAPI(urlString: API.UserAPI)
                    
//                    /* If using Await and Async */
//                    await viewModel.getProductsFromAPI()
                }
                
            }
        }
        
    }
    
    // This is View Builder which uses function to perform the given task and return in some view.
    @ViewBuilder
    func DetailedViewFunc() -> some View{
        if let result = viewModel.dataModel?.results {
            ForEach(result, id:\.id) { result in
                NavigationLink() {
                    DetailedView(result:result)
                }label: {
                    HStack(spacing:10){
                        ForEach(result.imageUrlsThumbnails, id:\.self){ img in
                            AsyncImage(url: URL(string: img)) { Image in
                                Image.resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView().tint(.pink)
                                
                            }.frame(width:100,height:100)
                        }
                        
                        VStack(alignment:.leading,spacing: 10){
                            Text(result.name).font(.headline)
                            Text(result.createdAt).font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(result.price).font(.title3)
                                .foregroundColor(.pink)
                            
                        }
                    }
                }
                
            }
        } 
    }

    
    }


#Preview {
    ContentView()
}
