import UIKit

protocol MainPageViewModelDelegate: AnyObject {
    func didUpdateCountries()
}

class MainPageViewModel {

    private var itemModel: MainPageModel
    private var delegate: MainPageViewModelDelegate?
    var countriesData: [MainPageModel.country] = []
    var filteredCountriesData: [MainPageModel.country] = []
    
    init(itemModel: MainPageModel, delegate: MainPageViewModelDelegate) {
        self.itemModel = itemModel
        self.delegate = delegate
    }
        
    func filterCountries(by searchText: String) {
        if searchText.isEmpty {
            filteredCountriesData = countriesData
        } else {
            filteredCountriesData = countriesData.filter { $0.name.common.lowercased().contains(searchText.lowercased()) }
        }
        delegate?.didUpdateCountries()
    }
    

    func getCountriesData() {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("HTTP response status code indicates error: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode([MainPageModel.country].self, from: data)
                self.countriesData = responseData
                self.filteredCountriesData = responseData
                DispatchQueue.main.async {
                    self.delegate?.didUpdateCountries()
                }
                
            } catch {
                print("Error decoding response data: \(error)")
            }
        }
        
        task.resume()
    }
    
}

