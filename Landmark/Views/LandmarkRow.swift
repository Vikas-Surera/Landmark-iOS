//
//  LandmarkRow.swift
//  Landmark
//
//  Created by Vikas Surera on 09/07/22.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50,height: 50 )
            
            Text(landmark.name)
                .font(.subheadline)
            
            Spacer()
            
            if(landmark.isFavorite){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            
            LandmarkRow(landmark: landmarks[1])
        }
        .previewDevice("iPhone 13")
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
