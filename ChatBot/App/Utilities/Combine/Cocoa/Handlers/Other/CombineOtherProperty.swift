//
//  CombineOtherProperty.swift
//  ChatBot
//

import Combine
import UIKit

class OtherProperty: NSObject {
        
    //MARK: Attributes
    
    private let textViewTextPublisher = PassthroughSubject<String?, Never>()
    private let textViewDidBeginEditingPublisher = PassthroughSubject<Void, Never>()
    private let textViewDidEndEditingPublisher = PassthroughSubject<Void, Never>()
    
    private let searchBarTextPublisher = PassthroughSubject<String?, Never>()
    
}

//MARK: UITextView

extension OtherProperty: UITextViewDelegate {
    
    func textPublisher(for textView: UITextView) -> AnyPublisher<String?, Never> {
        (textView as! CombineTextView).delegate = self
        return textViewTextPublisher.eraseToAnyPublisher()
    }
    
    func textDidBeginEditingPublisher(for textView: UITextView) -> AnyPublisher<Void, Never> {
        (textView as! CombineTextView).delegate = self
        return textViewDidBeginEditingPublisher.eraseToAnyPublisher()
    }
    
    func textDidEndEditingPublisher(for textView: UITextView) -> AnyPublisher<Void, Never> {
        (textView as! CombineTextView).delegate = self
        return textViewDidEndEditingPublisher.eraseToAnyPublisher()
    }
    
    //Delegates
    func textViewDidChange(_ textView: UITextView) {
        textViewTextPublisher.send((textView as! CombineTextView).text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewDidBeginEditingPublisher.send(())
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textViewDidEndEditingPublisher.send(())
    }
}


//MARK: UISearchBar

extension OtherProperty: UISearchBarDelegate {
    
    func textPublisher(for searchBar: UISearchBar) -> AnyPublisher<String?, Never> {
        searchBar.delegate = self
        return searchBarTextPublisher.eraseToAnyPublisher()
    }
    
    //Delegates
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBarTextPublisher.send(searchBar.text)
    }
}
