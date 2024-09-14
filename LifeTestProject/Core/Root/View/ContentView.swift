//
//  ContentView.swift
//  LifeTestProject
//
//  Created by Нияз Ризванов on 14.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    init() {
        // Настройка внешнего вида UINavigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hexString: "#2e004a")
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    if !viewModel.inhabitants.isEmpty {
                        ScrollView {
                            ForEach(viewModel.inhabitants) { inhabitants in
                                ContentRow(type: inhabitants)
                            }
                            .padding()
                        }
                    } else {
                        Text("Пусто")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .frame(maxHeight: .infinity)
                    }
                }

                Spacer()

                Button(action: { viewModel.addInhabitant() }) {
                    Text("CОТВОРИТЬ")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 36)
                .background(Color(UIColor(hexString: "#5A3472")))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal)
            }
            .background(.black)
            .navigationTitle("Клеточное наполнение")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
