//
//  UITableView.swift
//  KudaGo
//
//  Created by Alexey Ivanov on 12.01.2023.
//

import UIKit

extension UITableView {
    static func defaultReuseId(for elementType: UIView.Type) -> String {
        return String(describing: elementType)
    }
    
    func dequeueReusableHeaderFooterWithRegistration<T: UITableViewHeaderFooterView>(type: T.Type, reuseId: String? = nil) -> T {
        let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)
        
        if let view = dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as? T {
            return view
        }
        
        register(type, forHeaderFooterViewReuseIdentifier: normalizedReuseId)
        return dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as! T
    }
    
    func dequeueReusableCellWithRegistration<T: UITableViewCell>(type: T.Type, indexPath: IndexPath, reuseId: String? = nil) -> T {
        let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)
        
        if let cell = dequeueReusableCell(withIdentifier: normalizedReuseId) as? T {
            return cell
        }
        register(type, forCellReuseIdentifier: normalizedReuseId)
        return dequeueReusableCell(withIdentifier: normalizedReuseId, for: indexPath) as! T
    }
}
