//
//  ContentView.swift
//  TestDesign
//
//  Created by Chirag's on 12/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI
import Neumorphic
struct ContentView: View {
   @State private var pressed: Bool = false
    @State var showGreent: Bool = true
    var toggleText = "Sound On!"
    @State var textFieldValue = ""
     @State var currentValue = 4.0
     @State var percentage: Float = 50
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        let cornerRadius : CGFloat = 15
        Neumorphic.shared.colorScheme = colorScheme
        let mainColor = Neumorphic.shared.mainColor()
        let secondaryColor = Neumorphic.shared.secondaryColor()
        let darkShadow = Neumorphic.shared.darkShadowColor()
        let lightShadow = Neumorphic.shared.lightShadowColor()
        return ZStack {
            //Color.offWhite
            LinearGradient(Color.offWhite, Color.lightStart)
            VStack {
                Button(action: {
                    print("Button tapped")
                    self.pressed.toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .contentShape(Circle())
                        .frame(width: 45, height: 45)
                        .shadow(color: Color.white, radius: 8, x: -5, y: -5)
                        .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 10, y: 10)
                        .background(Color.offWhite)
                }
                .buttonStyle(ABCircleButtonStyle())
                .padding()
                
                Divider()
                
                Button(action: {
                    print("clicked 2!")
                }) {
                    Image(systemName: "trash.circle.fill").resizable().frame(width: 50, height: 50, alignment: .center).foregroundColor(.red)
                }.softButtonStyle(RoundedRectangle(cornerRadius: cornerRadius), mainColor: mainColor, textColor: .white, darkShadowColor: darkShadow, lightShadowColor: lightShadow)
                    .frame(width: 100, height: 100, alignment: .center).padding()
                
                
                
                
                Divider()
                
                Button(action: {
                    print("clicked 3!")
                }) {
                    ABButtonImage(imageName: "person.crop.circle.fill", shape: "Rectangle")
                    
                    
                }
                .buttonStyle(ABButtonStyle2())
                .padding()
                Divider()
                VStack {
                   ZStack {
                        RoundedRectangle(cornerRadius: 35).fill(mainColor)
                            .softInnerShadow(RoundedRectangle(cornerRadius: 35), darkShadow: darkShadow, lightShadow: lightShadow, spread: 0.03, radius: 3)
                        HStack{
                            TextField("User Name", text: $textFieldValue).font(.system(size: 28)).foregroundColor(secondaryColor)
                            Spacer()
                        }.padding()
                   }.frame(width: UIScreen.main.bounds.width - 64, height:40)
                }
                .padding()
                    
                Divider()
                VStack {
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 35).fill(mainColor)
                            .softInnerShadow(RoundedRectangle(cornerRadius: 35), darkShadow: darkShadow, lightShadow: lightShadow, spread: 0.05, radius: 2).padding()
                        CustomView(percentage: $percentage)
                            .accentColor(.red)
                            .frame(width: UIScreen.main.bounds.width - 64, height: 30)
                            .padding()

                    }
                }.frame(width: UIScreen.main.bounds.width - 64, height:30)
                Divider()
                
        }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let offWhite = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 210 / 255, green: 210 / 255, blue: 220 / 255)
    //static let lightEnd = Color(red:  / 255, green: 80 / 255, blue: 120 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
struct ABRectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Rectangle())
            .foregroundColor(configuration.isPressed ? .gray : .red)
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(Color.offWhite)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 5)
                                    .offset(x: 2, y: 2)
                                    .mask(Rectangle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 8))
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(Rectangle().fill(LinearGradient(Color.clear, Color.black)))
                    } else {
                        Rectangle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 8, y: 8)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
            })
    }
}
struct ABCircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .foregroundColor(configuration.isPressed ? .gray : .red)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 5)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8))
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 8, y: 8)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
            })
    }
}

struct ABButtonStyle2: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            // .padding(30)
          
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(Color.offWhite)
                            .cornerRadius(20)
                            .shadow(color: Color.white, radius: 8, x: 5, y: 5)
                            .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: -5, y: -5)
                    } else {
                        Rectangle()
                            .fill(Color.offWhite)
                            .cornerRadius(20)
                            .shadow(color: Color.white, radius: 8, x: -5, y: -5)
                            .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 10, y: 10)
                        
                    }
            })
        .foregroundColor(configuration.isPressed ? .gray : .red)
                  .scaleEffect(configuration.isPressed ? 0.98 : 1)
                  .animation(.spring())
        
        
    }
}

struct ABButtonImage: View {
    
    @State var imageName: String?
    @State var shape: String?
    var body: some View {
        Image(systemName: imageName ?? "heart.fill")
            .resizable()
            .frame(width: 45, height: 45)
            .shadow(color: Color.white, radius: 8, x: -5, y: -5)
            .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 10, y: 10)
            .padding(30)
            .background(Color.offWhite)
            .cornerRadius(20)
    }
    
}

struct CustomView: View {

    @Binding var percentage: Float // or some value binded
    let darkShadow = Neumorphic.shared.darkShadowColor()
    let lightShadow = Neumorphic.shared.lightShadowColor()
    var body: some View {
        GeometryReader { geometry in
            // TODO: - there might be a need for horizontal and vertical alignments
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.clear)
               /* Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))*/
                RoundedRectangle(cornerRadius: 20).fill(Color.red)
                    .softOuterShadow(darkShadow: self.darkShadow, lightShadow: self.darkShadow, offset: -4, radius: 5)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(15)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO: - maybe use other logic here
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            if configuration.isOn {
                Rectangle()
                    .fill(Color.offWhite)
                    .cornerRadius(20)
                    .shadow(color: Color.white, radius: 8, x: 5, y: 5)
                    .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: -5, y: -5).onTapGesture {
                        configuration.isOn.toggle()
                }
            } else {
                Rectangle()
                    .fill(Color.offWhite)
                    .cornerRadius(20)
                    .shadow(color: Color.white, radius: 8, x: -5, y: -5)
                    .shadow(color: Color(red: 163/255, green: 177/255, blue: 198/255), radius: 8, x: 10, y: 10).onTapGesture {
                            configuration.isOn.toggle()
                    }
            }
//                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
