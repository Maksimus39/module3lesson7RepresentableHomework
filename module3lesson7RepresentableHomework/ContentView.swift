import SwiftUI

struct ContentView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    private var isEditingBinding: Binding<Bool> {
        Binding(
            get: { viewModel.isEditing },
            set: { viewModel.isEditing = $0 }
        )
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 52) {
                VStack(spacing: 39) {
                    VStack(alignment: .center, spacing: 19) {
                        UIImageRepresentableView()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        NameSurnameView()
                    }
                    
                    VStack(alignment: .leading, spacing: 7) {
                        Text("О себе")
                            .padding(.leading, 13)
                            .font(.system(size: 12, weight: .bold))
                        Text(viewModel.me)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 14)
                            .font(.system(size: 12, weight: .light))
                            .background(Color.textcolor)
                            .cornerRadius(14)
                    }
                    
                    VStack(alignment: .leading, spacing: 14) {
                        PhotoView()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                UIButtonRepresentable(title: "История правления") {
                    viewModel.isEditing = true
                }
                .frame(height: 59)
                .padding(.bottom, 56)
            }
            .padding(20)
        }
        .navigationDestination(isPresented: isEditingBinding) {
            TableUIKitRepresentableView()
                .environment(viewModel)
                .navigationTitle(viewModel.name +  " " + viewModel.surname)
        }
    }
}


#Preview {
    ContentView()
        .environment(CoreDataAppViewModel())
}
