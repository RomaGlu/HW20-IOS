import UIKit

let networkObject = Network()

let urlAdressBlackLotus = "https://api.magicthegathering.io/v1/cards?name=black%20lotus"
let urlAdressOpt = "https://api.magicthegathering.io/v1/cards?name=opt"

networkObject.getData(urlRequest: urlAdressOpt)
networkObject.getData(urlRequest: urlAdressBlackLotus)

