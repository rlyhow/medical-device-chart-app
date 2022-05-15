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
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 4)
            )
    }
}

struct MainView: View {
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
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
                        NavigationLink(destination: {}) {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
