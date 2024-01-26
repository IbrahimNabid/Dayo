//
//  Motivation.swift
//  Dayo
//
//  Created by Ibrahim Nabid on 12/8/23.
//


import SwiftUI

struct Motivation: View {
    // Array of motivational quotes
    let motivationalQuotes = [
        "Believe you can and you're halfway there. - Theodore Roosevelt",
        "The only way to do great work is to love what you do. - Steve Jobs",
        "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
        "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
        "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
        "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
        "It does not matter how slowly you go as long as you do not stop. - Confucius",
        "Everything you’ve ever wanted is on the other side of fear. - George Addair",
        "Success is not the key to happiness. Happiness is the key to success. - Albert Schweitzer",
        "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
        "A journey of a thousand miles begins with a single step. - Lao Tzu",
        "The secret of getting ahead is getting started. - Mark Twain",
        "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
        "The only thing standing between you and your goal is the story you keep telling yourself as to why you can't achieve it. - Jordan Belfort",
        "The purpose of life is not to be happy. It is to be useful, to be honorable, to be compassionate, to have it make some difference that you have lived and lived well. - Ralph Waldo Emerson",
        "I can't change the direction of the wind, but I can adjust my sails to always reach my destination. - Jimmy Dean",
        "Believe you can and you're halfway there. - Theodore Roosevelt",
        "Don't judge each day by the harvest you reap but by the seeds that you plant. - Robert Louis Stevenson",
        "The only way to achieve the impossible is to believe it is possible. - Charles Kingsleigh",
        "Magic is believing in yourself, if you can do that, you can make anything happen. - Johann Wolfgang von Goethe",
        "In the middle of every difficulty lies opportunity. - Albert Einstein",
        "What you get by achieving your goals is not as important as what you become by achieving your goals. - Zig Ziglar",
        "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
        "To see what is right and not do it is a lack of courage. - Confucius",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got this. - Chantal Sutherland",
        "In order to succeed, we must first believe that we can. - Nikos Kazantzakis",
        "We may encounter many defeats but we must not be defeated. - Maya Angelou",
        "Knowing is not enough; we must apply. Willing is not enough; we must do. - Johann Wolfgang von Goethe",
        "We should not give up and we should not allow the problem to defeat us. - A.P.J. Abdul Kalam",
        "Always do your best. What you plant now, you will harvest later. - Og Mandino",
        "You just can't beat the person who never gives up. - Babe Ruth",
        "Start where you are. Use what you have. Do what you can. - Arthur Ashe",
        "Never give up, for that is just the place and time that the tide will turn. - Harriet Beecher Stowe",
        "Good, better, best. Never let it rest. 'Til your good is better and your better is best. - St. Jerome",
        "It always seems impossible until it's done. - Nelson Mandela",
        "It does not matter how slowly you go as long as you do not stop. - Confucius",
        "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
        "Set your goals high, and don't stop till you get there. - Bo Jackson",
        "Aim for the moon. If you miss, you may hit a star. - W. Clement Stone",
        "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
        "A creative man is motivated by the desire to achieve, not by the desire to beat others. - Ayn Rand",
        "Expect problems and eat them for breakfast. - Alfred A. Montapert",
        "If you want to conquer fear, don't sit home and think about it. Go out and get busy. - Dale Carnegie",
        "It always seems impossible until it's done. - Nelson Mandela",
        "Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy. - Norman Vincent Peale",
        "The will to win, the desire to succeed, the urge to reach your full potential... these are the keys that will unlock the door to personal excellence. - Confucius",
        "Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step. - Lao Tzu",
        "Press forward. Do not stop, do not linger in your journey, but strive for the mark set before you. - George Whitefield",
        "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
        "Aim for the moon. If you miss, you may hit a star. - W. Clement Stone"
    ]
    
    
    // State variable to store the currently displayed quote index
    @State private var currentQuoteIndex = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.mint, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
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
                VStack {
                    // Dayo logo
                    Image("Dayonobg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 300)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    // Motivational quote
                    Text(motivationalQuotes[currentQuoteIndex])
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    // Button to change the quote
                    Button("Next Quote") {
                        currentQuoteIndex = (currentQuoteIndex + 1) % motivationalQuotes.count
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Spacer()
                }
            }
        }
    }
    struct Motivation_Previews: PreviewProvider {
        static var previews: some View {
            Motivation()
        }
    }
}
