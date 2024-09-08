//
//  DetailedView.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation
import SwiftUI

struct DetailedView: View {
    
    var result:Result
    var gridColumns = [GridItem(.flexible())]
    @State var loading:Bool = true
    
    var body: some View {
        ZStack{
            LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                .frame(width:100, height: 200).padding()
        
        VStack{
            Text(result.name).font(.system(size: 35, weight:.bold, design:.monospaced))
                .italic()
                .foregroundStyle(.black.gradient)
           
            List{
                Section(){
                    imageUrlFunc()
                }
                .frame(width:320, height:200)
                .cornerRadius(20)
                
                //------
                
                Section(){
                    detailedInfoFunc()
                }
                .cornerRadius(20)
                
                //------
                
            }
            .scrollContentBackground(.hidden)
            .cornerRadius(20)
            
        }.padding(10)
            .redacted(reason: loading ? .placeholder: [])
            .onAppear(){
                Task{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        loading = false
                    }
                }
            }
        
    }
        
    }
    //----------------------VIEWBUILDER 1------
    @ViewBuilder
    func imageUrlFunc() -> some View{
        ForEach(result.imageUrls, id:\.self){ img in
            AsyncImage(url: URL(string: img)) { Image in
                Image.resizable()
                    .frame(width:320, height:200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView().tint(.pink)
                
            }
        }
    }

    //----------------------VIEWBUILDER 2------
    @ViewBuilder
    func detailedInfoFunc() -> some View{
        VStack(alignment:.leading,spacing: 15){
            Text("Name: " + result.name).font(.headline).italic()
            Text("CreatedAt: " + result.createdAt).font(.subheadline).italic().bold()
            ForEach(result.imageIDS, id:\.self){ outcome in
                Text("ID: " + outcome)
            }.font(.system(size: 13, weight:.bold, design:.monospaced)).italic()
            Text("Price: " + result.price).font(.title3).italic().bold()
            
        }.frame(width:320, height:140)
         .foregroundColor(.black)
    }

    
}


struct productDetails_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(result: Result(id: UUID(), createdAt: "", price: "", name: "", uid: "", imageIDS: [""], imageUrls: [""], imageUrlsThumbnails: [""]))
    }
}
