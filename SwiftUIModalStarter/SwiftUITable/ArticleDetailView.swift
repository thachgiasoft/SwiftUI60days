//
//  ArticleDetailView.swift
//  SwiftUINavigation
//
//  Created by Simon Ng on 18/9/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.presentationMode) var presentationMode

    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .overlay(

            HStack {
                Spacer()

            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                })
                                .padding(.trailing, 20)
                                .padding(.top, 40)

                                Spacer()
                            }
                        }
        )
        .edgesIgnoringSafeArea(.top)

        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}
