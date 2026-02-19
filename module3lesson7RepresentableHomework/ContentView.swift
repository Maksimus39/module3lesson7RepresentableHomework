import SwiftUI

struct ContentView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            Image(viewModel.userImage)
                .resizable()
                .frame(width: 100, height: 100)
            Text(viewModel.name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(CoreDataAppViewModel())
}
