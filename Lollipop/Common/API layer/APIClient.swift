//
//  APIClient.swift
//  VideoAI
//
//  Created by Aleksandar Draskovic on 24/02/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    //MARK: Timeout setup
    
    var APISession: Session
    let configuration = URLSessionConfiguration.default
    
    private init() {
      configuration.timeoutIntervalForRequest = 30
      APISession = Session(configuration: configuration)
    }
    private static let sharedClient = APIClient()
  
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        if !Connectivity.isConnectedToInternet(){
            UIApplication.root().view.hideSpinner()
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning, text: Titles.checkInternet, shouldDismiss: false)
            return sharedClient.APISession.request("")
        }
          return sharedClient.APISession.request(route)
              .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                  print("API response code: ",response.response?.statusCode ?? "")
                  print("API URL: ", response.request?.url?.absoluteString ?? "")
                  let json = JSON(response.data ?? Data())
                  print("API result: ", json)
                switch response.response?.statusCode{
                case 200, 201:
                    completion(response.result)
                case 401:
                    print("Unknown")
                case 403, 404, 500:
                    Alert().alertMessageNoNavigator(title: Titles.notice, text: Titles.unknownError, shouldDismiss: false)
                    UIApplication.root().view.hideSpinner()
                    print("Unknown")
                default:
                    UIApplication.root().view.hideSpinner()
                }
              }.responseString { (response) in
            //print("Odgovor:",response.value)
          }
      }
        
   //MARK: API methods
     static func getconfig(completion:@escaping (Result<SubscribeModel, AFError>)->Void){
         performRequest(route: APIRouter.getconfig, completion: completion)
     }
    
}
