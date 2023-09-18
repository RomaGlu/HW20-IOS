import Foundation

struct TodoModel: Codable {
    var userId: Int
    var id: Int?
    var title: String
    var completed: Bool
}

//подготовка и проверка урл
let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
guard let requestUrl = url else { fatalError() }

//подготовка объекта URLRequest к запросу
var request = URLRequest(url: requestUrl)
request.httpMethod = "POST"

//задаем заголовки
request.setValue("application/json", forHTTPHeaderField: "Accept")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let todoModel = TodoModel(userId: 159, title: "Задача на завтра", completed: false)

let jsonData = try JSONEncoder().encode(todoModel)

request.httpBody = jsonData



//параметры запроса
let postString = "userId=159&title=Задача на завтра&completed=false"

//тело запроса
request.httpBody = postString.data(using: String.Encoding.utf8)

//выполнение HTTP запроса
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    
//    проверяем на наличие ошибок
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    DispatchQueue.main.async {
           
        }
//    конвертируем полученную data в String
    
    }
task.resume()


