import Foundation

public class Network {
    
    public init(){}
    
    public func getData(urlRequest: String) {
        let urlRequest = URL(string: urlRequest)
        
        guard let url = urlRequest else {
            print("Invalid URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(String(describing: error.localizedDescription))")
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Response code: \(response.statusCode)\n")
                
                guard let data = data else { return }
                
                do {
                    let dataAsString = try JSONDecoder().decode(Cards.self, from: data)
                    let result = dataAsString.cards.filter { card in card.name == "Opt" || card.name == "Black Lotus"}
                    result.map { card in
                        DispatchQueue.main.sync {
                            print(
            """
            Card name: "\(card.name ?? "unknown")
            Card type: \(card.type ?? "unknown")
            Card manacost: \(card.manaCost ?? "unknown")
            Card rarity: \(card.rarity ?? "unknown")
            Card set: \(card.set ?? "unknown")
            Card artist: \(card.artist ?? "unknown")
            Card number: \(card.number ?? "unknown")
            Card power: \(card.power ?? "unknown")
            
            """
                            )
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        } .resume()
    }
}
