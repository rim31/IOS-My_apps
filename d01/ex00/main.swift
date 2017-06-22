// Fichier de test : compiler avec => swiftc Color.swift Value.swift Main.swift

for col in Color.allColors {
    print("\(col) : \(col.rawValue)")
}

for val in Value.allValues {
    print("\(val) : \(val.rawValue)")
}
