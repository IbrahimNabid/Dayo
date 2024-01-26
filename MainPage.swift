import SwiftUI

struct MainPage: View {
    @State var tasks = ["Buy groceries", "Do laundry", "Finish homework", "Study for test"]
    @State var newTask = ""
    @State var favoritedTasks: [String: Bool] = [:]
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationView {
                    NavigationLink(destination: Login()) {
                        Spacer()
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.orange)
                            .cornerRadius(15.0)
                            .padding(.bottom, 20)
                            .padding(.leading, 10)
                    }
                    Spacer()
                }
                Text("🚀 Let's conquer the day! 💪")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Enter new task", text: $newTask)
                    .foregroundColor(Color.black)
                    .padding()
                    .border(Color.black)
                    .background(Color(.white))
                
                Button("Add task") {
                    if !newTask.isEmpty && !(tasks.contains(newTask)) {
                        tasks.append(newTask)
                        newTask = ""
                    }
                }
                .foregroundColor(.white)
                .padding()
                
                if tasks.isEmpty {
                    VStack {
                        Text("**Hooray! You've completed all your tasks! 🎉**")
                            .font(.headline)
                            .foregroundColor(Color(red: 238/255, green: 188/255, blue: 29/255))
                            .padding()
                        
                        Text("**Why not add a new task and keep the productivity going? 💪**")
                            .font(.headline)
                            .foregroundColor(.indigo)
                            .padding()
                    }
                }
                
                ScrollView {
                    // Sort tasks based on whether they are favorited
                    let sortedTasks = tasks.sorted { (task1, task2) in
                        let isTask1Favorited = favoritedTasks[task1] ?? false
                        let isTask2Favorited = favoritedTasks[task2] ?? false
                        
                        if isTask1Favorited && !isTask2Favorited {
                            return true
                        }
                        
                        if isTask2Favorited && !isTask1Favorited {
                            return false
                        }
                        
                        return true
                    }
                    
                    ForEach(sortedTasks, id: \.self) { task in
                        HStack {
                            Text(task)
                            Spacer()
                            HStack {
                                Button(action: {
                                    // Toggle whether the task is favorited
                                    favoritedTasks[task] = !(favoritedTasks[task] ?? false)
                                }) {
                                    Image(systemName: favoritedTasks[task] ?? false ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                        .padding()
                                }
                                
                                Button(action: {
                                    if let index = tasks.firstIndex(of: task) {
                                        tasks.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .background(Color.cyan)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    struct MainPage_Previews: PreviewProvider {
        static var previews: some View {
            MainPage()
        }
    }
    
}
