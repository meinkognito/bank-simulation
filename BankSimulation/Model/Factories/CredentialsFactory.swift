//
//  CredentialsFactory.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/25/22.
//

import CryptoKit
import Foundation

final class CredentialsFactory {
  let appState: AppState?
  
  init(appState: AppState? = nil) {
    self.appState = appState
  }

  func makeCredentials(login: String, password: String) -> Int? {
    guard let appState else { return nil }

    var credentials = Credentials.empty

    if let last = appState.storage.credentials.last {
      credentials.credentials_id = last.credentials_id + 1
    } else {
      credentials.credentials_id = 1
    }

    credentials.login = login
    credentials.password = SHA256.hash(data: Data(password.utf8))
      .compactMap { String(format: "%02x", $0) }.joined()

    appState.storage.credentials.appendAndStore(credentials, appState: appState)
    
    return credentials.credentials_id
  }
}