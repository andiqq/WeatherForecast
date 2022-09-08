import Vapor
import Foundation

struct WeatherForecastController: RouteCollection {
    
    var Summaries = [ "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching" ]
    
    func boot(routes: RoutesBuilder) throws {
        let weatherForecast = routes.grouped("WeatherForecast")
        weatherForecast.get(use: index)
    }
    
    func index(req: Request) async throws -> [WeatherForecast] {
               
        let Forecast = (0...4).map {
            WeatherForecast(
                date: Date().advanced(by: Double($0 * 24 * 3600)),
                TemperatureC: Int.random(in: -40...55),
                Summary:Summaries[Int.random(in: 0..<Summaries.count)] )
        }
    
        return Forecast
    }
    
}


