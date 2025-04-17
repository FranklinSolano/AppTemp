//
//  Protocol+ViewCode.swift
//  AppTemp
//
//  Created by Franklin  Stilhano Solano on 17/04/25.
//

protocol ViewCodeProtocol: AnyObject {
    func setupElements()
    func setupConstraints()
}

extension ViewCodeProtocol {
    func setupView(){
        setupElements()
        setupConstraints()
    }
}
