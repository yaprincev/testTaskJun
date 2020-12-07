//
//  TableViewController.swift
//  test
//
//  Created by Maxim on 03.12.2020.
//

import UIKit

class TableViewController: UITableViewController {

    

    let emptyUser = AllData()     // Вспомогательная константа
    // Основной массив для ввода id
    var people = [127460100, 1, 572534614, 53083705, 279938622, 265870743, 135336811]
    var newPple = [String]()      // Массив, для преобразования основного массива (из int в string)
    var peopleId = [AllData]()    // Массив пришедших данных
    override func viewDidLoad() {
        super.viewDidLoad()
        newPeople()
        masOfUsers()
        
        
        if peopleId.isEmpty {               // Заполнение массива данных (для появления индексов)
            peopleId = Array(repeating: emptyUser, count: people.count)
        }
    }
    
    // Основная функция getUser для получение информации через id в открытом REST VkApi
    
    func getUser (user: String, completionHandler: @escaping (AllData) -> Void) {
        let urlVk = "https://api.vk.com/method/users.get?user_ids=\(user)&fields=home_town,followers_count,online,bdate,country,sex&v=8.89&access_token=584667875846678758466787795833225d55846584667870781f24b423cac51b434b72f"
        guard let url = URL(string: urlVk) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let user = self.parseJSon(data: data) {
                completionHandler(user)
            }
        }
        task.resume()
    }
    
    // Функция парса JSON
    
    func parseJSon (data: Data) -> AllData? {
        let decoder = JSONDecoder()
        do {
            let vkData = try decoder.decode(VkData.self, from: data)
            guard let allData = AllData(vkData: vkData) else {
                return nil
            }
            return allData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

    //  Функция result для использования массива, состоящего из id, в getUser

    func res (peopleArray: [String], completionHandler: @escaping (Int, AllData) -> Void) {
        for (index, item) in newPple.enumerated() {
            getUser(user: String(item)) { (alldata) in
                completionHandler(index, alldata)
            }
        }
    }
    
    // Функция massive of people для получения и вывода массива peopleId, состоящего из данных
    
    func masOfUsers () {
        res(peopleArray: self.newPple) { (index, alldata) in
            self.peopleId[index] = alldata
            self.peopleId[index].id = self.people[index]
            print(self.peopleId)
        }
    }
    
    // Определения количества строк
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    // Вывовд id в строки
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = newPple[indexPath.row]
        return cell
    }

    // заполнение ViewcController через Segue

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.users = peopleId[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    // Функция для преобразования исходного массива (people) в массив из строк (newpple)
    
    func newPeople () {
        for i in people {
            newPple.append(String(i))
        }
    }
}
