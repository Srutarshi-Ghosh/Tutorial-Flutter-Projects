

const API_KEY = "M5GABF6KYmI2Z9GuHGNP1NW6ZLE1Hr1e";

class LocationHelper {

    static generateLocationPreviewImage({double latitude, double longitude}) {
        return 'http://api.tomtom.com/map/1/staticimage?key=$API_KEY&zoom=15&center=$longitude,$latitude&format=jpg&layer=basic&style=main&view=IN';
    }

}

