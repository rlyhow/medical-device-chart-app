//
//  ContentView.swift
//  MedicalDeviceChartApp
//
//  Created by Mikita Shalima on 12.05.22.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title.bold())
            .foregroundColor(.white)
            .frame(height: 88)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(16)
            .shadow(color: .gray, radius: 4, x: 5, y: 5)
    }
}

struct MainView: View {
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                Text("Добро пожаловать!")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.green)
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 4)
                    )
                    .padding(.horizontal, 40)
                
                HStack(spacing: 20) {
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "person.2")
                                .padding(.leading, 20)
                            Text("ПОЛЬЗОВАТЕЛИ")
                                .frame(maxWidth: .infinity)
                                .lineLimit(1)
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                                .padding(.leading, 20)
                            Text("ЗАПИСЬ")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 40)
                
                HStack(spacing: 20) {
                    
                    Button(action: {}) {
                        NavigationLink(destination: WatchChartView()) {
                            HStack {
                                Image(systemName: "doc.text.magnifyingglass")
                                    .padding(.leading, 20)
                                Text("ПРОСМОТР")
                                    .frame(maxWidth: .infinity)
                            }
                        } .frame(maxHeight: .infinity)
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "gear")
                                .padding(.leading, 20)
                            Text("НАСТРОЙКИ")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.horizontal, 40)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscape
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
