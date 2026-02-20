import Foundation

@Observable class CoreDataAppViewModel: CoreDataAppProtocol {
    let id: String = UUID().uuidString
    var name: String = ""
    var surname: String = ""
    var userImage: String = ""
    var me: String = ""
    var userPhotoProfile: [UserPhotoProfile] = []
    var title: String = ""
    var news: [News] = []
    
    private let dataManager = DataManager()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let data = dataManager.getData()
        self.name = data.name
        self.surname = data.surname
        self.userImage = data.userImage
        self.me = data.me
        self.userPhotoProfile = data.userPhotoProfile
        self.title = data.title
        self.news = data.news
    }
}
