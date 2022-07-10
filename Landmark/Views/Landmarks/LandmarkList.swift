//
//  LandmarkList.swift
//  Landmark
//
//  Created by Vikas Surera on 09/07/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showPrivateOnly = false
    
    var filterLandmarks: [Landmark]{
        modelData.landmarks.filter{ landmark in
            (!showPrivateOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showPrivateOnly){
                    Text("Favorites only")
                }
                
                ForEach(filterLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LandmarkList()
            .environmentObject(ModelData())
        
    }
}
