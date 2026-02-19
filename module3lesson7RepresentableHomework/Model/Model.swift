import Foundation

struct AppData: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let surname: String
    var userImage: String
    var me: String
    var userPhotoProfile: [UserPhotoProfile]
    let title: String
    var news: [News]
}


struct UserPhotoProfile: Identifiable {
    let id: String = UUID().uuidString
    var image: String
}

struct News: Identifiable {
    let id: String = UUID().uuidString
    var image: String
    var text: String
}
