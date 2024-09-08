# SwiftUIAccessibility

    - This is an iOS app that displays a list of different products and their information and images. The app is written in SwiftUI and uses MVVM architecture.
    - This Application uses single API Call to show show data and has a home screen and a detailed view screen.
    
    

## Project Description 

    - This Application has 2 Pages ->
                              - HomePage -> Displaying name,price,createdAt of the products on this screen
                              - DetailedView -> It displays the imageURLs, imagethumbnailURLS and imageIDS of the images
                              
    - API Website - https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer

## Table of Contents

   - In the structure files contains: Model, View, ViewModel, Network 
   - Model -> Its the dataModel which I used to get the data from API and display on the views
   - View  -> It shows the Views of my Application, how every page of the application will look
   - ViewModel -> It Communicates with the Network to fetch the data and pass on to the View by interacting with data model
   - Network -> It is used to get the API Call and to get the data to pass to the ViewModel
   
   Animation Framework Lottie is used to enhance the style of the application and is used in the DetailedView Screen.


# Installation
   Can be used with Xcode 14.3 and above. Compatible with iPhone and iPad with minimum iOS version 16.0.

# Framework
   - SwiftUI 
   - Combine
   - Lottie
   - Async/await 
   - AysncImage(So if the images are in an array then it can  displayed asynchronous)
   

# Architecture
   - MVVM- This application uses MVVM for the views and Combine for the reactive behaviour of the application such as the data update that is to be updated and any memory management to be done. It also helps in API call so that the combine framework can be used efficiently in View Model and network Manager


# Design Patterns
    - Singleton - It is used in the Network Manager while using URLSession for API Call

# Created By: Raghav Bansal
   













