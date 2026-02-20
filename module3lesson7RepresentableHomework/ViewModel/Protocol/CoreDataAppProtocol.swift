protocol CoreDataAppProtocol {
    var id: String { get }
    var name: String { get set }
    var surname: String { get set }
    var userImage: String { get set}
    var me: String { get set }
    var userPhotoProfile: [UserPhotoProfile] { get set }
    var title: String { get set }
    var news: [News] { get set }
}
