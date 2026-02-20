import SwiftUI

struct ContentView: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 52) {
                VStack (spacing: 39){
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
                            .background(.textcolor)
                            .cornerRadius(14)
                    }
                    
                    VStack(alignment: .leading, spacing: 14) {
                        PhotoView()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                UIButtonRepresentable()
                    .frame(height: 59)
                    .padding(.bottom, 56)
            }
            .padding(20)
            Spacer()
        }
        
    }
}


struct UIButtonRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        {
            $0.setTitle("Редактировать", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .buttoncolor
            $0.layer.cornerRadius = 20
            return $0
        }(UIButton())
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
       //
    }
}





#Preview {
    ContentView()
        .environment(CoreDataAppViewModel())
}
