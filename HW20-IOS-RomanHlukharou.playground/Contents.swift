import UIKit

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    
    guard let url = urlRequest else {
        print("Invalid URL.")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(String(describing: error.localizedDescription))")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Response code: \(response.statusCode)")
            
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            
            do {
                let result = try JSONDecoder().decode(Cards.self, from: data)
                print(
"""
Card name: "\(result.cards.first?.name ?? String())
Card type: \(result.cards.first?.type ?? String())
Card manacost: \(result.cards.first?.manaCost ?? String())
Card rarity: \(result.cards.first?.rarity ?? String())
Card set: \(result.cards.first?.set ?? String())
Card artist: \(result.cards.first?.artist ?? String())
Card number: \(result.cards.first?.number ?? String())
Card power: \(result.cards.first?.power ?? String())

"""
                )
                
            }
            catch {
                print(error)
            }
        }
    } .resume()
}

let urlAdressBlackLotus = "https://api.magicthegathering.io/v1/cards?name=black%20lotus"
let urlAdressOpt = "https://api.magicthegathering.io/v1/cards?name=opt"

getData(urlRequest: urlAdressOpt)
getData(urlRequest: urlAdressBlackLotus)

