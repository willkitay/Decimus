//
//  WorkoutTemplate.swift
//  decimus
//
//  Created by William Kitay on 11/15/21.
//

import SwiftUI

struct WorkoutTemplate: View {
    @State private var isShowingTemplate = false
    @State var isShowingAddExerciseForm = false
    @State private var template = ""
    
    var body: some View {
        ZStack {
            isShowingAddExerciseForm ? Color.gray.edgesIgnoringSafeArea(.all) : Color.white.edgesIgnoringSafeArea(.all)
            ScrollView {
                header
                title
    //            exerciseList
                appendExercise
            }
            if isShowingAddExerciseForm {
                AddExercise(state: $isShowingAddExerciseForm)
            }
        }
    }
    
    var header: some View {
        HStack {
            Button(action: setTimer) { Image(systemName: "trash") }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .controlSize(.small)
                .tint(isShowingAddExerciseForm ? CustomColor.darkGray : CustomColor.lightGray)
                .foregroundColor(.black)
            Spacer()
            Button(action: saveTemplate) { Text("Save") }
            .tint(isShowingAddExerciseForm ? CustomColor.darkBlue : .blue)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .controlSize(.small)
        }
        .padding()
    }
    
    var title: some View {
        TextField("New Template", text: $template)
            .padding()
            .font(.title.weight(.semibold))
    }
    
    var appendExercise: some View {
        Button {
            withAnimation(.linear(duration: 0.2)) {
                isShowingAddExerciseForm.toggle()
            }
        } label: {
            Text("Add Exercise")
                .padding([.leading, .trailing], 120)
        }
        .tint(CustomColor.lightBlue)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 5))
        .controlSize(.small)
        .foregroundColor(.blue)
        .font(.headline)
    }
}

struct AddExercise: View {
    @Binding var state: Bool
    @State var name = ""
    @State var sets = ""
    @State var reps = ""
    @State var notes = ""
    
    var body: some View {
        VStack {
            header
            exercise
            setStepper
            repCount
            Title(text: "Notes")
            TextEditor(text: $notes)
                .frame(height: 150)
                .textFieldStyle(.roundedBorder)
                .textSelection(.enabled)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 0.1)
                )
                .padding([.leading, .trailing])
        }
        .frame(maxWidth: .infinity, maxHeight: 430)
        .padding(.bottom, 100)
        .background(.white)
        .cornerRadius(15)
        .padding()
    }
    
    var header: some View {
        HStack {
            exitButton
            Spacer()
            addButton
        }
    }
    
    var exitButton: some View {
        Button {
            state.toggle()
        } label: {
            Image(systemName: "clear")
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 5))
        .controlSize(.regular)
        .tint(CustomColor.lightGray)
        .foregroundColor(.black)
        .padding()
        .padding(.top, 55)
    }
    
    var addButton: some View {
        Button {
            #warning ("implement save functionality")
        } label: {
            Text("Add")
                .fontWeight(.bold)
                .foregroundColor(name.count > 0 ? .blue : CustomColor.darkGray)
                .padding()
                .padding(.top, 50)
        }
    }
    
    var exercise: some View {
        TextField("Exercise", text: $name)
            .padding([.leading, .trailing, .bottom])
            .font(.title.weight(.semibold))
    }
    
    var setStepper: some View {
        VStack {
            Title(text: "Sets")
            HStack {
                TextField("3", text: $sets)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 50)
                    .padding(.leading)
                    .padding(.bottom)
                Spacer()
            }
        }
    }
    
    var repCount: some View {
        VStack {
            Title(text: "Reps")
            HStack {
                TextField("8", text: $reps)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 50)
                    .padding(.leading)
                    .padding(.bottom)
                Spacer()
            }
        }
    }
}

private func saveTemplate() {
    #warning ("implement saveTemplate")
}

private func setTimer() {
    #warning ("implement setTimer")
}

struct Title: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .padding([.leading, .trailing])
                .font(.headline)
            Spacer()
        }
    }
}


struct ExerciseTemplate_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTemplate()
//        AddExercise()
    }
}
