enum Flavor {
  DEV,
  PROD,
}

class F {
  static Flavor ?appFlavor;

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.DEV:
        return "https://prd-cefol.azurewebsites.net/";
      case Flavor.PROD:
        return "https://prd-cefol.azurewebsites.net/";
      default:
        return "https://prd-cefol.azurewebsites.net/"; 
    }
  }
}
