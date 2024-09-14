//
//  ContentRow.swift
//  LifeTestProject
//
//  Created by Нияз Ризванов on 14.09.2024.
//

import SwiftUI

enum TypeInhabitants: Int, Identifiable, CaseIterable {
    case alive
    case dead
    case life

    var imageUrl: String {
        switch self {
        case .alive: return "alive"
        case .dead: return "dead"
        case .life: return "life"
        }
    }

    var title: String {
        switch self {
        case .alive: return "Живой"
        case .dead: return "Мертвый"
        case .life: return "Жизнь"
        }
    }

    var description: String {
        switch self {
        case .alive: return "и шевелится!"
        case .dead: return "или прикидывается"
        case .life: return "Ку-ку!"
        }
    }

    var backgroundColors: [Color] {
        switch self {
        case .alive: return [Color(UIColor(hexString: "#FFB800")), Color(UIColor(hexString: "#FFF7B0"))]
        case .dead: return [Color(UIColor(hexString: "#0D658A")), Color(UIColor(hexString: "#B0FFB4"))]
        case .life: return [Color(UIColor(hexString: "#AD00FF")), Color(UIColor(hexString: "#FFB0E9"))]
        }
    }

    var emoji: String {
        switch self {
        case .alive: return "💥"
        case .dead: return "💀"
        case .life: return "🐣"
        }
    }

    var id: Int {return rawValue}
}

struct ContentRow: View {
    var type: TypeInhabitants
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: type.backgroundColors,
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 40, height: 40)

                Text(type.emoji)
            }


            VStack(alignment: .leading, spacing: 2) {
                Text(type.title)
                    .font(.title3)
                    .fontWeight(.semibold)

                Text(type.description)
                    .font(.footnote)
            }
            .foregroundStyle(.black)

            Spacer()
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .scaleEffect(scale)
        .opacity(opacity)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

#Preview {
    ContentRow(type: .alive)
}
