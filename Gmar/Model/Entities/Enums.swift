//
//  Enums.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation

class Enums{
    public enum BasicEvent : Int{
        case UKNOWN = 0
        case feces
        case feed
        case sleep
        case rash
        case cough
        case feever
        case vomit
        case hafrahsa
        case urine
        //internal use:
        case foodOrDrink
        case solidorMilk
        case solidFoods
        case water
        case milk
        case tamal
        case attandance
    }
    
    public enum FamilyReport : Int{
        case UNKNOWN = 0
        case feever
        case illness
        case rash
        case inflammation
        case cough
        case cooling
        case no_eating
        case continous_crying
        case vaccine
        case unpeace_sleeping
        case tooth_growing
        case moving_to_solid_food
        case constipation
        case moving_to_tamal_food
        case switch_taml_kind
        case medication
        case other
    }
}
