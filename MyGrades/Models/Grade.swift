//
//  Grade.swift
//  MyGrades
//
//  Created by Valentin Perignon on 26/07/2020.
//  Copyright © 2020 Valentin Perignon. All rights reserved.
//

import Foundation

/// A  grade
class Grade: ObservableObject, Identifiable, Codable {
  // MARK: Properties
  
  var id: UUID = UUID()
  
  @Published var name: String
  @Published var value: Double
  @Published var coefficient: Double
  
  // MARK: CodingKey
  
  enum CodingKeys: CodingKey {
    case id
    case name
    case value
    case coefficient
  }
  
  // MARK: Initializer
  
  init(name: String, value: Double, coefficient: Double) {
    self.name = name
    self.value = value
    self.coefficient = coefficient
  }
  
  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try values.decode(UUID.self, forKey: .id)
    self.name = try values.decode(String.self, forKey: .name)
    self.value = try values.decode(Double.self, forKey: .value)
    self.coefficient = try values.decode(Double.self, forKey: .coefficient)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(self.id, forKey: .id)
    try container.encode(self.name, forKey: .name)
    try container.encode(self.value, forKey: .value)
    try container.encode(self.coefficient, forKey: .coefficient)
  }
}
