//
//  ViewController.swift
//  MVVM
//
//  Created by Chitaranjan Sahu on 10/07/17.
//  Copyright © 2017 me.in. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    var weatherDataArray = [ModelData]()
    
    let coordinateString: String = "12.9279,77.6271"
    override func viewDidLoad() {
        super.viewDidLoad()
         headerLabel.text = "Weather for \(coordinateString)"
        
        guard let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
            let keys = NSDictionary(contentsOfFile: path),
            let apiKey = keys["apiKey"] as? String else {
                print("Issue with keys.plist")
                return
        }
        
        
        let networkcall = NetworkManager.init(apiKey)
        networkcall.getWeatherForCoordinate(coordinate: coordinateString) { [unowned self]  (data:[ModelData]?, error:NSError?) in
            
            if let data = data{
                    self.weatherDataArray = data
                DispatchQueue.main.async {
                self.tableView.reloadData()    
                }
                
            }
        
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let weatherData = weatherDataArray[indexPath.row]
       // let weatherViewModel = WeatherViewModel(weatherData)
        //weatherViewModel.tapCell(tableView, indexPath: indexPath)
    }
    
}

extension ViewController:UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherData = weatherDataArray[indexPath.row]
        let weatherViewModel = ViewModel(weatherData)
        return weatherViewModel.cellInstance(tableView, cellForRowAt: indexPath)
    }
    
    
}

