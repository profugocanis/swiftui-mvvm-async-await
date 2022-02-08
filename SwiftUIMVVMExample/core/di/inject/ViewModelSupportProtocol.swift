import Foundation

protocol ViewModelSupportProtocol {
    var viewModels: [BaseViewModel?] { get }
    func addViewModel(_ vm: BaseViewModel?)
}
