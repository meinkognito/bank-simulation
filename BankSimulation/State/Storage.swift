import Foundation
import PostgresClientKit

final class Storage: ObservableObject {
  // MARK: - Public interface

  static let `default` = Storage()

  @Published var credentials = [Credentials]()

  @Published var cities = [City]()
  @Published var regions = [Region]()
  @Published var offices = [Office]()

  @Published var admin = [Admin]()
  @Published var managers = [Manager]()
  @Published var passports = [Passport]()
  @Published var clients = [Client]()

  @Published var accounts = [Account]()
  @Published var applications = [Application]()
  @Published var transactions = [Transaction]()

  // MARK: - loading data

  func loadData(with connection: Connection?) {
    guard let connection = connection else { return }

    do {
      // credentials
      let credentialsText = "SELECT * FROM credentials;"
      let credentialsStatement = try connection.prepareStatement(text: credentialsText)
      defer { credentialsStatement.close() }

      let credentialsCursor = try credentialsStatement.execute(retrieveColumnMetadata: true)
      defer { credentialsCursor.close() }

      for row in credentialsCursor {
        credentials.append(try row.get().decodeByColumnName(Credentials.self))
      }

      // cities
      let citiesText = "SELECT * FROM cities;"
      let citiesStatement = try connection.prepareStatement(text: citiesText)
      defer { citiesStatement.close() }

      let citiesCursor = try citiesStatement.execute(retrieveColumnMetadata: true)
      defer { citiesCursor.close() }

      for row in citiesCursor {
        cities.append(try row.get().decodeByColumnName(City.self))
      }

      // regions
      let regionsText = "SELECT * FROM regions;"
      let regionsStatement = try connection.prepareStatement(text: regionsText)
      defer { regionsStatement.close() }

      let regionsCursor = try regionsStatement.execute(retrieveColumnMetadata: true)
      defer { regionsCursor.close() }

      for row in regionsCursor {
        regions.append(try row.get().decodeByColumnName(Region.self))
      }

      // offices
      let officesText = "SELECT * FROM offices;"
      let officesStatement = try connection.prepareStatement(text: officesText)
      defer { officesStatement.close() }

      let officesCursor = try officesStatement.execute(retrieveColumnMetadata: true)
      defer { officesCursor.close() }

      for row in officesCursor {
        offices.append(try row.get().decodeByColumnName(Office.self))
      }

      // admin
      let adminText = "SELECT * FROM admin;"
      let adminStatement = try connection.prepareStatement(text: adminText)
      defer { adminStatement.close() }

      let adminCursor = try adminStatement.execute(retrieveColumnMetadata: true)
      defer { adminCursor.close() }

      for row in adminCursor {
        admin.append(try row.get().decodeByColumnName(Admin.self))
      }

      // managers
      let managersText = "SELECT * FROM personal_managers;"
      let managersStatement = try connection.prepareStatement(text: managersText)
      defer { managersStatement.close() }

      let managersCursor = try managersStatement.execute(retrieveColumnMetadata: true)
      defer { managersCursor.close() }

      for row in managersCursor {
        managers.append(try row.get().decodeByColumnName(Manager.self))
      }

      // passports
      let passportsText = "SELECT * FROM passports;"
      let passportsStatement = try connection.prepareStatement(text: passportsText)
      defer { passportsStatement.close() }

      let passportsCursor = try passportsStatement.execute(retrieveColumnMetadata: true)
      defer { passportsCursor.close() }

      for row in passportsCursor {
        passports.append(try row.get().decodeByColumnName(Passport.self))
      }

      // clients
      let clientsText = "SELECT * FROM clients;"
      let clientsStatement = try connection.prepareStatement(text: clientsText)
      defer { clientsStatement.close() }

      let clientsCursor = try clientsStatement.execute(retrieveColumnMetadata: true)
      defer { clientsCursor.close() }

      for row in clientsCursor {
        clients.append(try row.get().decodeByColumnName(Client.self))
      }

      // accounts
      let accountsText = "SELECT * FROM accounts;"
      let accountsStatement = try connection.prepareStatement(text: accountsText)
      defer { accountsStatement.close() }

      let accountsCursor = try accountsStatement.execute(retrieveColumnMetadata: true)
      defer { accountsCursor.close() }

      for row in accountsCursor {
        accounts.append(try row.get().decodeByColumnName(Account.self))
      }

      // applications
      let applicationsText = "SELECT * FROM applications;"
      let applicationsStatement = try connection.prepareStatement(text: applicationsText)
      defer { applicationsStatement.close() }

      let applicationsCursor = try applicationsStatement.execute(retrieveColumnMetadata: true)
      defer { applicationsCursor.close() }

      for row in applicationsCursor {
        applications.append(try row.get().decodeByColumnName(Application.self))
      }

      // transactions
      let transactionsText = "SELECT * FROM transactions;"
      let transactionsStatement = try connection.prepareStatement(text: transactionsText)
      defer { transactionsStatement.close() }

      let transactionsCursor = try transactionsStatement.execute(retrieveColumnMetadata: true)
      defer { transactionsCursor.close() }

      for row in transactionsCursor {
        transactions.append(try row.get().decodeByColumnName(Transaction.self))
      }
    } catch {
      print(error)
    }
  }
}
