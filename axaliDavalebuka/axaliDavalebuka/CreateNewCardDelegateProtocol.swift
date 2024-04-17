//
//  CreateNewCardDelegateProtocol.swift
//  axaliDavalebuka
//
//  Created by Nini Bardavelidze on 15.04.24.
//

import Foundation

protocol CreateNewCardDelegate: AnyObject {
    func didCreateNewCard(newData: [Wuwuni])
}
