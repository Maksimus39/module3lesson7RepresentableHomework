import SwiftUI

struct NameSurnameView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        HStack(spacing: 5) {
            Text(viewModel.name)
            Text(viewModel.surname)
        }
        .font(.system(size: 20, weight: .bold))
    }
}
