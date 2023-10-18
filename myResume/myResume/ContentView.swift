//
//  ContentView.swift
//  myResume
//
//  Created by Actor on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    @State var isShowingContact = false
    var body: some View {
        ScrollView {
            VStack {
                CardView
                
                Text(me.bio).font(.title3).lineSpacing(10)
                
                ButtonView
                
                Text("Skills").font(.title.weight(.bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                
                SkillView
                
                Text("Experience").font(.title.weight(.bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                
                ExperienceView
            }
        }
        .padding()
        .overlay(
            Color.black.opacity(isShowingContact ? 0.5 : 0)
                .onTapGesture{ isShowingContact = false}
        )
        .overlay(alignment: .top){
            ContactView
        }
        .animation(.spring(), value: isShowingContact)
    }
    //        .background(Color(uiColor: .secondarySystemBackground))
    
    var CardView: some View {
        HStack {
            Image("avatar").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()) .frame(width:200)
            VStack(spacing: 20) {
                Text(me.name).font(.title2).bold()
                Text(me.title)
                Label(me.location, systemImage: "paperplane.fill")
            }
        }
    }
    
    var ButtonView:some View {
        Button(action: {
            isShowingContact = true
        }, label:{
            Text("Contact me")
                .frame(maxWidth:.infinity,alignment: .center)
                .foregroundColor(.white).font(.title2.weight(.bold))
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.brown))
        })
    }
    
    var SkillView: some View {
        HStack {
            ForEach(me.skills, id: \.self){ skill in
                VStack {
                    Image(skill.lowercased()).resizable().aspectRatio(contentMode: .fit).frame(width: 50)
                    
                    Text(skill).font(.body.weight(.medium))
                }.frame(width: 80)
            }
        }
    }
    var ExperienceView: some View {
        VStack(spacing: 0) {
            ForEach(me.experiences.indices,id: \.self){ index in
                let exp = me.experiences[index]
                HStack {
                    //                            VStack(spacing: 0) {
                    //                                Circle()
                    //                                    .frame(width: 10)
                    //                                Rectangle()
                    //                                .frame(width: 5)
                    //
                    //                            }.foregroundColor(.secondary)
                    
                    DotLineShape(lineWidth: 4,circleSize: 14,style:index == 0 ? .bottomHalf :  index == me.experiences.count - 1 ? .topHalf : .full ).frame(width: 60).foregroundColor(.secondary)
                    
                    
                    VStack(spacing: 8) {
                        Group{
                            Text(exp.start + "-" + exp.end)
                                .foregroundColor(.secondary)
                            Text(exp.title).font(.title3).bold()
                            Text(exp.company).padding(.bottom,40)
                        }.frame(maxWidth:.infinity, alignment: .leading)
                    }
                }
            }
        }
    }
    var ContactView: some View {
        Group {
            if isShowingContact {
                OverDialog(isShowing: $isShowingContact)
                    .offset(y:UIScreen.main.bounds.maxY * 0.32)
                    .transition(.slide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isShowingContact: false)
    }
}
