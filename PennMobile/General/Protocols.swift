//
//  Protocols.swift
//  PennMobile
//
//  Created by Josh Doman on 5/12/17.
//  Copyright © 2017 PennLabs. All rights reserved.
//

import MBProgressHUD

protocol IndicatorEnabled {}

extension IndicatorEnabled where Self: UITableViewController {
    func showActivity() {
        tableView.isUserInteractionEnabled = false
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideActivity() {
        tableView.isUserInteractionEnabled = true
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension IndicatorEnabled where Self: UIViewController {
    func showActivity() {
        view.isUserInteractionEnabled = false
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideActivity() {
        view.isUserInteractionEnabled = true
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension IndicatorEnabled where Self: UIView {
    func showActivity() {
        self.isUserInteractionEnabled = false
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    func hideActivity() {
        self.isUserInteractionEnabled = true
        MBProgressHUD.hide(for: self, animated: true)
    }
}

protocol Trackable {}

extension Trackable where Self: UIViewController {
    func track(_ name: String?) {
        if let name = name {
            GoogleAnalyticsManager.shared.track(name)
        }
    }
}

protocol HairlineRemovable {}

extension HairlineRemovable {
    
    func removeHairline(from view: UIView) {
        if let hairline = findHairlineImageViewUnder(view: view) {
            hairline.isHidden = true
        }
    }
    
    //finds hairline underview if there is one
    private func findHairlineImageViewUnder(view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            let imageView = findHairlineImageViewUnder(view: subview)
            if let iv = imageView {
                return iv
            }
        }
        return nil
    }
}

@objc protocol ShowsAlert {}

extension ShowsAlert where Self: UIViewController {
    func showAlert(withMsg: String, title: String = "Error", completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: withMsg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let completion = completion {
                completion()
            }
        }))
        present(alertController, animated: true, completion: nil)
    }
}


