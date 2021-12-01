//
//  QueryService.swift
//  speedlimit
//
//  Created by Alexander Kytmanov on 11/23/19.
//  Copyright © 2019 Alexander Kytmanov. All rights reserved.
//

import Foundation

enum APIError:Error {
    case noDataAvailable
    case canNotrocessData
}

class QueryService {
    var urlComponents = URLComponents()
    
    init(latitude: String, longitude: String){
        urlComponents.scheme = "https"
        urlComponents.host = "overpass-api.de"
        urlComponents.path = "/api/interpreter"
        urlComponents.queryItems = [
            URLQueryItem(name: "data", value: "[out:json][timeout:25];(way(around:25,\(latitude),\(longitude))[\"maxspeed\"];);(._;>;);out;")
        ]
    }
    
    func getNodes(completion: @escaping(Result<[Element], APIError>) -> Void){
        let apiURL = urlComponents.url!
        let request = URLRequest(url: apiURL)
        _ = URLSession.shared.dataTask(with: request) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                let decoder = JSONDecoder()
                let apiResponse =  try decoder.decode(Node.self, from: jsonData)
                let elements = apiResponse.elements
                completion(.success(elements))
            } catch {
                completion(.failure(.canNotrocessData))
            }
        }.resume()
    }
    
  
    let tempJsonData = """
    {
      "version": 0.6,
      "generator": "Overpass API 0.7.55.1009 5e627b63",
      "osm3s": {
        "timestamp_osm_base": "2019-11-30T18:34:02Z",
        "copyright": "The data included in this document is from www.openstreetmap.org. The data is made available under ODbL."
      },
      "elements": [
        {
          "type": "node",
          "id": 241864860,
          "lat": 55.7573842,
          "lon": 37.6186972
        },
        {
          "type": "node",
          "id": 438117559,
          "lat": 55.7563835,
          "lon": 37.6167165
        },
        {
          "type": "node",
          "id": 963869241,
          "lat": 55.7569775,
          "lon": 37.6155967
        },
        {
          "type": "node",
          "id": 1388848251,
          "lat": 55.7569499,
          "lon": 37.6156488
        },
        {
          "type": "node",
          "id": 1475286191,
          "lat": 55.7574957,
          "lon": 37.6191279
        },
        {
          "type": "node",
          "id": 1563541883,
          "lat": 55.7567626,
          "lon": 37.6160019
        },
        {
          "type": "node",
          "id": 4037292826,
          "lat": 55.7565065,
          "lon": 37.6172290
        },
        {
          "type": "node",
          "id": 4037292827,
          "lat": 55.7565779,
          "lon": 37.6174154
        },
        {
          "type": "node",
          "id": 4037292828,
          "lat": 55.7569637,
          "lon": 37.6156228,
          "tags": {
            "barrier": "lift_gate",
            "bicycle": "yes",
            "foot": "yes"
          }
        },
        {
          "type": "node",
          "id": 4178701414,
          "lat": 55.7563602,
          "lon": 37.6168327
        },
        {
          "type": "node",
          "id": 4178701415,
          "lat": 55.7563604,
          "lon": 37.6168773
        },
        {
          "type": "node",
          "id": 4178701416,
          "lat": 55.7563645,
          "lon": 37.6167887
        },
        {
          "type": "node",
          "id": 4178701417,
          "lat": 55.7563658,
          "lon": 37.6169225
        },
        {
          "type": "node",
          "id": 4178701418,
          "lat": 55.7563721,
          "lon": 37.6167509
        },
        {
          "type": "node",
          "id": 4178701419,
          "lat": 55.7563736,
          "lon": 37.6169638
        },
        {
          "type": "node",
          "id": 4178701422,
          "lat": 55.7563845,
          "lon": 37.6170000
        },
        {
          "type": "node",
          "id": 4178701423,
          "lat": 55.7563978,
          "lon": 37.6170312
        },
        {
          "type": "node",
          "id": 4178701474,
          "lat": 55.7566370,
          "lon": 37.6175096
        },
        {
          "type": "node",
          "id": 4178704496,
          "lat": 55.7567132,
          "lon": 37.6176310
        },
        {
          "type": "node",
          "id": 4178704515,
          "lat": 55.7568120,
          "lon": 37.6177884
        },
        {
          "type": "node",
          "id": 4178704528,
          "lat": 55.7568712,
          "lon": 37.6178828
        },
        {
          "type": "node",
          "id": 4178704550,
          "lat": 55.7569500,
          "lon": 37.6180084
        },
        {
          "type": "node",
          "id": 4178705205,
          "lat": 55.7571826,
          "lon": 37.6183791
        },
        {
          "type": "node",
          "id": 4178705224,
          "lat": 55.7573379,
          "lon": 37.6186242,
          "tags": {
            "crossing": "uncontrolled",
            "highway": "crossing"
          }
        },
        {
          "type": "node",
          "id": 4178716369,
          "lat": 55.7565035,
          "lon": 37.6164903
        },
        {
          "type": "node",
          "id": 4178716370,
          "lat": 55.7569345,
          "lon": 37.6156777
        },
        {
          "type": "node",
          "id": 4217328007,
          "lat": 55.7563886,
          "lon": 37.6170097
        },
        {
          "type": "node",
          "id": 4217328077,
          "lat": 55.7565998,
          "lon": 37.6163087
        },
        {
          "type": "node",
          "id": 5224504065,
          "lat": 55.7574401,
          "lon": 37.6188357
        },
        {
          "type": "way",
          "id": 142774541,
          "nodes": [
            1475286191,
            5224504065,
            241864860,
            4178705224,
            4178705205,
            4178704550,
            4178704528,
            4178704515,
            4178704496,
            4178701474,
            4037292827
          ],
          "tags": {
            "highway": "service",
            "lanes": "1",
            "maxspeed": "10",
            "oneway": "yes",
            "surface": "asphalt"
          }
        },
        {
          "type": "way",
          "id": 246591515,
          "nodes": [
            438117559,
            4178716369,
            4217328077,
            1563541883,
            4178716370,
            1388848251,
            4037292828,
            963869241
          ],
          "tags": {
            "highway": "service",
            "lanes": "1",
            "maxspeed": "10",
            "oneway": "yes",
            "surface": "paving_stones"
          }
        },
        {
          "type": "way",
          "id": 401294352,
          "nodes": [
            4037292827,
            4037292826,
            4178701423,
            4217328007,
            4178701422,
            4178701419,
            4178701417,
            4178701415,
            4178701414,
            4178701416,
            4178701418,
            438117559
          ],
          "tags": {
            "highway": "service",
            "lanes": "1",
            "maxspeed": "10",
            "oneway": "yes",
            "surface": "paving_stones"
          }
        }
      ]
    }
    """.data(using: .utf8)!
}
