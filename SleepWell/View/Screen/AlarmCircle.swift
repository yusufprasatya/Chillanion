//
//  AlarmCircle.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 20/10/23.
//
import SwiftUI

struct AlarmCircle: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
        SleepTimeSlider()
    }
    @ViewBuilder
    func SleepTimeSlider()->some View{
        
        GeometryReader{proxy in}
    }
}

struct AlarmCircle_Previews: PreviewProvider {
    static var previews: some View {
        AlarmCircle()
    }
}
