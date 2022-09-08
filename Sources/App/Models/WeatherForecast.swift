import Vapor

struct WeatherForecast: Content {
    
    var date: Date
    
    var TemperatureC: Int
    
    var _TemperatureF: Int { get { return 32 + Int(Double(TemperatureC) / 0.556) }}
    
    var TemperatureF: Int = 0
    
    var Summary: String?
    
    init(date: Date, TemperatureC: Int, Summary: String? = nil) {
        self.date = date
        self.TemperatureC = TemperatureC
        self.Summary = Summary
        TemperatureF = _TemperatureF
    }
    
}
