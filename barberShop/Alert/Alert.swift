

import UIKit

class Alert {
    
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    public func showAlertInformation(tittle: String, message: String, completion: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
            completion?()
            
        }
        
        alertController.addAction(action)
        
        controller.present(alertController, animated: true)
        
    }
    
}
