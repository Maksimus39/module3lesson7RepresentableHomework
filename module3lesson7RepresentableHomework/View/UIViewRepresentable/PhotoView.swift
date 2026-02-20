import SwiftUI

struct PhotoView: View {
    var body: some View {
        Text("Фото")
            .font(.system(size: 12, weight: .bold))
            .padding(.leading, 13)
        
        ContentPhotoView()
    }
}


struct ContentPhotoView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    let columnsPhoto: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: columnsPhoto, spacing: 10) {
            ForEach(viewModel.userPhotoProfile, id: \.id) { p in
                if let _ = UIImage(named: p.image) {
                    Image(p.image)
                       .resizable()
                       .frame(height: 190)
                       .cornerRadius(20)
                }
            }
        }
    }
}
