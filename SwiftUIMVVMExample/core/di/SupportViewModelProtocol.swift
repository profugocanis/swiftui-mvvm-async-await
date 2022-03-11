import Foundation

protocol SupportViewModelProtocol {
    var viewModels: [BaseViewModel?] { get }
    func addViewModel(_ vm: BaseViewModel?)
}
