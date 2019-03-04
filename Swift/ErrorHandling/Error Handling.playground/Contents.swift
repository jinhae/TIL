import UIKit

// Error Handling

//Representing and Throwing Errors


enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinNeeded: 5)

// Handling Errors

// Propagating Errors Using Throwing Functions

struct Item{
    var price: Int
    var count: Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels" : Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws{
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
    
    
}


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob" : "Licorice",
    "Eve" : "Pretzels",
]

func buyFavoriteSnak(person: String, vendingMachine: VendingMachine) throws{
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack{
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws{
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
