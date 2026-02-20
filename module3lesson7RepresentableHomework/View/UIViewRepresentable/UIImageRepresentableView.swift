import SwiftUI


struct UIImageRepresentableView: UIViewRepresentable {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    func makeUIView(context: Context) -> UIImageView {
        {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            return $0
        }(UIImageView())
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.image = UIImage(named: viewModel.userImage)
    }
}
