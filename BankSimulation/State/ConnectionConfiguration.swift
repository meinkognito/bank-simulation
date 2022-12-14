import PostgresClientKit

let myConfiguration: ConnectionConfiguration = {
  var configuration = ConnectionConfiguration()
  configuration.host = "localhost"
  configuration.database = "postgres"
  configuration.user = "postgres"
  configuration.ssl = false
  configuration.port = 5433
  configuration.credential = .trust
  return configuration
}()
