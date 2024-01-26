import SwiftUI

struct NewAccountPage: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var resultMessage: String = ""

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Image("Dayonobg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding()

                    Text("Create New Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)

                    TextField("Name", text: $name)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .border(Color.white)

                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .border(Color.white)

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .border(Color.white)

                    TextField("Re-enter Email", text: $confirmEmail)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .border(Color.white)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.white))
                        .border(Color.white)
                        .cornerRadius(5.0)
                        .foregroundColor(.black)

                    SecureField("Re-enter Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .border(Color.white)

                    Button(action: {
                        Task {
                            await sendNewUserData()
                        }
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 220, height: 60)
                            .background(Color.cyan)
                            .cornerRadius(15.0)
                    }
                    .padding()

                    HStack {
                        Text("Status : ")

                        Text(resultMessage)
                            .frame(width: 275, height: 70, alignment: .leading)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                    }

                    Spacer()
                }
                .padding()
                .background(Color(red: 0.745, green: 0.827, blue: 0.976))
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarHidden(true)
        }
    }

    func sendNewUserData() async {
        resultMessage = "Processing, one moment..."

        let userStr =  "username=" + username
        let passStr =  "&password=" + password

        let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/createUserCS4400.cgi")

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

struct NewAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountPage()
    }
}




