//
//  TabView.swift
//  ShareChange
//
//  Created by Rahil Patel on 5/8/20.
//  Copyright © 2020 RahilPatel. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State var offset: CGFloat = 0
    @State var oldOffset: CGFloat = 0
    @State var currentPage = 0
    @State var scrollOffset: CGFloat = 0
    
    let gradient = Gradient(colors: [Color("primary_color"), Color("secondary_color")])
    let fadedGradient = Gradient(colors: [Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0), Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.8)])
    let images = [Image(systemName: "chevron.down.circle"), Image(systemName: "globe"), Image(systemName: "person")]
    let texts = ["Donations", "Info", "Profile"]

    var body: some View {
        ZStack {
            GeometryReader { outsideGeo in
                GeometryReader { reader in
                    ZStack {
                        ForEach(0..<self.viewModel.numShapes) { num in
                            self.makeTriangle(num: num)
                        }
                    HStack {
                        DonationsView(scrollOffset: self.$scrollOffset).frame(width: reader.frame(in: .global).width).offset(x: 0, y: 40)
                        InformationView(scrollOffset: self.$scrollOffset).frame(width: reader.frame(in: .global).width).offset(x: 0, y: 40)
                        ProfileView(scrollOffset: self.$scrollOffset).frame(width: reader.frame(in: .global).width).offset(x: 0, y: 40)
                    }
                    }
                    .background(LinearGradient(gradient: self.gradient, startPoint: .top, endPoint: .bottom))
                    .offset(x: self.offset != 0 ? self.offset : -reader.frame(in: .global).width * (CGFloat(self.currentPage) - CGFloat(1)) + (self.currentPage == 2 ? -6 : (self.currentPage == 0 ? 6 : 0)), y: 0)
                    .gesture(DragGesture()
                    .onChanged({ (val) in
                        let width = reader.frame(in: .global).width
                        let newOffset = self.oldOffset + val.location.x - val.startLocation.x
                        if newOffset < width && newOffset > -width {
                            self.offset = newOffset
                        }
                        print(self.offset)
                    })
                    .onEnded({ (val) in
                        let width = reader.frame(in: .global).width
                        withAnimation {
                            if self.offset > width / 2 {
                                self.offset = width + 6
                                self.currentPage = 0
                            } else if self.offset < -width / 2 {
                                self.offset = -width - 6
                                self.currentPage = 2
                            } else {
                                self.offset = 0
                                self.currentPage = 1
                            }
                            self.oldOffset = self.offset
                            print("End: \(self.offset)")
                        }
                    }))
                }.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    LinearGradient(gradient: self.fadedGradient, startPoint: .top, endPoint: .bottom).frame(height: 120)
                }.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.offset = 0
                                self.currentPage = 0
                                self.oldOffset = CGFloat((0 - 1)) * outsideGeo.frame(in: .global).width
                            }
                        }) {
                            TabItem(image: Image(systemName: "chevron.down.circle"), text: "Donate", selected: Binding(get: {
                                self.currentPage == 0
                            }, set: { (_) in
                                
                            }))
                        }.offset(x: 0, y: self.currentPage == 0 ? -10 : 0)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.offset = 0
                                self.currentPage = 1
                                self.oldOffset = CGFloat((1 - 1)) * outsideGeo.frame(in: .global).width
                            }
                        }) {
                            TabItem(image: Image(systemName: "globe"), text: "Info", selected: Binding(get: {
                                self.currentPage == 1
                            }, set: { (_) in
                                
                            }))
                        }.offset(x: 0, y: self.currentPage == 1 ? -10 : 0)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.offset = 0
                                self.currentPage = 2
                                self.oldOffset = CGFloat((2 - 1)) * outsideGeo.frame(in: .global).width
                            }
                        }) {
                            TabItem(image: Image(systemName: "person.fill"), text: "Profile", selected: Binding(get: {
                                self.currentPage == 2
                            }, set: { (_) in
                                
                            }))
                        }.offset(x: 0, y: self.currentPage == 2 ? -10 : 0)
                        Spacer()
                    }.frame(height: 100).foregroundColor(.white)
                }.edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    func makeTriangle(num: Int) -> some View {
        print("Scroll: \(self.scrollOffset)")
        return Triangle(shapeWidth: self.viewModel.shapeWidth)
            //.frame(width: CGFloat(viewModel.shapeWidth), height: viewModel.shapeWidth)
            .foregroundColor(Color("secondary_color"))
            .cornerRadius(5)
            .shadow(radius: 5)
            .rotationEffect(self.viewModel.rotations[num])
            .position(self.viewModel.positions[num])
            .offset(x: 0, y: self.scrollOffset * 0.5)
            //.position(x: 414, y: 896)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TabItem: View {
    var image: Image
    var text: String
    @Binding var selected: Bool
    var body: some View {
        VStack {
            image.font(Font.title.weight(self.selected ? .semibold : .light))
            Text(text).font(Constants.textFont.weight(.semibold))
        }.padding()
    }
}
