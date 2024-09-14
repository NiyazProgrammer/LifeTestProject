//
//  ContentViewModel.swift
//  LifeTestProject
//
//  Created by Нияз Ризванов on 14.09.2024.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var inhabitants: [TypeInhabitants] = []
    private var lastThreeStates: [TypeInhabitants] = []

    func addInhabitant() {
        let newInhabitant: TypeInhabitants
        // Проверка последних 3 состояний
        if lastThreeStates.filter({ $0 == .alive }).count == 3 {
            newInhabitant = .life
            lastThreeStates.removeAll()
        } else if lastThreeStates.filter({ $0 == .dead }).count == 3 {
            inhabitants.removeAll { $0 == .life }
            newInhabitant = .dead
            lastThreeStates.removeAll()
        } else {
            // Равномерное создание
            newInhabitant = Bool.random() ? .alive : .dead
        }

        // Добавлени нового жителя и обновление историю
        inhabitants.append(newInhabitant)
        lastThreeStates.append(newInhabitant)

        // Проверка, что в истории сохраняются только последние три состояния
        if lastThreeStates.count > 3 {
            lastThreeStates.removeFirst()
        }
    }
}
