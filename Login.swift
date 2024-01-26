import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var resultMessage: String = ""

    var body: some View {

        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Image("Dayo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .clipped()
                        .padding()

                    Text("Dayo: The Brightest Way to Plan your Day")
                        .font(Font.custom("Uni Sans", size: 30, relativeTo: .title))
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .padding(.leading, 10)

                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .background(Color(.white))
                        .border(Color.black)
                        .padding()

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .background(Color(.white))
                        .border(Color.black)
                        .padding()

                    Button(action: {
                        Task {
                            await loginUserData()
                        }
                    }) {
                        NavigationLink(destination: MainTabView()) {
                            Text("Log In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 220, height: 60)
                                .background(Color.blue)
                                .cornerRadius(15.0)
                        }
                        .toolbar(.hidden, for: .navigationBar)
                    }
                    .padding()

                    NavigationLink(destination: NewAccountPage()) {
                        Text("Create New Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 220, height: 60)
                            .background(Color.orange)
                            .cornerRadius(15.0)
                            .padding(.bottom, 20)
                            .padding(.leading, 10)
                    }

                    HStack {
                        Text("Status : ")

                        Text(resultMessage)
                            .frame(width: 275, height: 70, alignment: .leading)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
            }
        }
    }

    func loginUserData() async {
        if username.isEmpty || password.isEmpty {
                resultMessage = "Username and password cannot be empty."
                return
            }
        resultMessage = "Processing, one moment..."

        let userStr =  "username=" + username
        let passStr =  "&password=" + password

        let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/loginUserCS4400.cgi")

        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        let postString = userStr + passStr

        request.httpBody = postString.data(using: String.Encoding.utf8);

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                resultMessage = "Error took place \(error)"
                return
            }

            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                resultMessage = "Resp:\(dataString)"

                username  = ""
                password = ""
            }

        }

        task.resume()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

