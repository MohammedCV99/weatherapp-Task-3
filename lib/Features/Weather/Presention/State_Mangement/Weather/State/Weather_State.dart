abstract class Weatherstate {}

class WeatherInitialState extends Weatherstate {}

class WeatherLoadingState extends Weatherstate {}

class WeatherGetInformationState extends Weatherstate {}

class WeatherErrorState extends Weatherstate {}

class UpdateIndex extends Weatherstate {}

class PredicitState extends Weatherstate {}
