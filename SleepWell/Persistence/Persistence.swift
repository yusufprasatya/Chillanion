//
//  Persistence.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SleepWell")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveItem(user: UserModel) {
        let context = container.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "User", in: context) {
            let newUser = NSManagedObject(entity: entity, insertInto: context) as! User
            newUser.id = UUID()
            newUser.name = user.name
            newUser.sleepCycle = user.sleepCycle
            newUser.targetWakeUpTime = user.targetWakeUpTime
            newUser.bedTimeCommitment = user.bedTimeCommitment
            
            do {
                try context.save()
                print("Item saved successfully")
            } catch {
                print("Error saving item: \(error)")
            }
        }
    }
    
    func fetch() -> User {
        let context = container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            let result = try context.fetch(request)
            if let firstResult = result.first {
                // Use firstResult, which is the first record in the entity
                return firstResult as! User
            } else {
                // Handle the case where no data is found
                print("No data found")
            }
        } catch {
            print("Error fetching user: \(error)")
        }
        
        return User()
    }
    
    func saveReminder(reminder: ReminderModel) {
        let context = container.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Reminder", in: context) {
            let newReminder = NSManagedObject(entity: entity, insertInto: context) as! Reminder
            newReminder.isRemind = reminder.isRemind
            
            do {
                try context.save()
                print("Item saved successfully")
            } catch {
                print("Error saving item: \(error)")
            }
        }
    }
    
    func updateReminder(dailyHabit: DailyHabits) {
        let context = container.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyHabits")
        fetchRequest.predicate = NSPredicate(format: "name = %@", dailyHabit.name ?? "") // Assuming 'id' is the unique identifier
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if let existingReminder = results.first as? DailyHabits {
                existingReminder.isRemind = true
                
                do {
                    try context.save()
                    print("Item updated successfully")
                } catch {
                    print("Error updating item: \(error)")
                }
            } else {
                print("Reminder not found for update")
            }
        } catch {
            print("Error fetching reminder: \(error)")
        }
    }
    func fetchReminder(name: String) -> Reminder {
        let context = container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminder")
        
        // Set up a predicate to filter by propertie
        
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate = predicate
        do {
            let result = try context.fetch(request)
            if let firstResult = result.first {
                // Use firstResult, which is the first record in the entity
                return firstResult as! Reminder
            } else {
                // Handle the case where no data is found
                print("No data found")
            }
        } catch {
            print("Error fetching user: \(error)")
        }
        
        return Reminder()
    }
    
    func saveJournal(journal: JournalEntry) {
        let context = container.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Journal", in: context) {
            let newJournal = NSManagedObject(entity: entity, insertInto: context) as! Journal
            newJournal.id = UUID()
            newJournal.create_date = journal.date
            newJournal.text = journal.text
            
            do {
                try context.save()
                print("Item saved successfully")
            } catch {
                print("Error saving item: \(error)")
            }
        }
    }
    
    func seedDataIfNeeded() {
            let context = container.viewContext
            print("seed the habit data")
            // Check if there's existing data
            let fetchRequest: NSFetchRequest<DailyHabits> = DailyHabits.fetchRequest()
            do {
                let count = try context.count(for: fetchRequest)
                if count == 0 {
                    // Seed data if no records found
                    seedInitialData(context: context)
                }
            } catch {
                fatalError("Failed to count records: \(error)")
            }
    }

    func seedInitialData(context: NSManagedObjectContext) {
        let dailyHabbitArr = [
            DailyHabbit(name: "Limit Caffeine", icon: "☕", desc: "It’s 6 hours before sleep! Time to limit your caffeine to have better sleep tonight!", isRemind: false, date: Date()),
            DailyHabbit(name: "Power Nap", icon: "😴", desc: "Seems like you were short of sleep last night! Take a 20-minute power nap to power up your energy!️", isRemind: false, date: Date()),
            DailyHabbit(name: "Sunlight", icon: "☀️️", desc: "Rise and shine, gorgeous! Get 15-minutes sunlight to start your day brighter and have a better mood!", isRemind: false, date: Date()),
            DailyHabbit(name: "Journaling", icon: "📝", desc: "Hey, how's your day going? Or do you have anything on your mind? Care to share?", isRemind: false, date: Date()),
            DailyHabbit(name: "Stop Late Meals", icon: "🍔", desc: "Let your body rest at night. Stop eating 4 hours before sleep to ensure uninterrupted Zzz's! ", isRemind: false, date: Date()),
            DailyHabbit(name: "Stop Heavy Work-out", icon: "🏋️️", desc: "Skip tough workouts before bed/ Your body needs to unwind and prepare for sweet dream!", isRemind: false, date: Date()),
            DailyHabbit(name: "Stay Hydrated", icon: "💧", desc: "Stay peppy! Sip on water throughout the day to keep fatigue at bay!", isRemind: false, date: Date()),
            DailyHabbit(name: "Mindful Breathing", icon: "🌼", desc: "Give yourself a little peace. Take mindful breaths for less stress, better focus, and stay on track!", isRemind: false, date: Date()),
            DailyHabbit(name: "Short Breaks", icon: "🚶🏻", desc: "Grab quick 5-10 minute sweet breaks to stretch or walk for an instant energy boost and improved alertness!", isRemind: false, date: Date()),
            DailyHabbit(name: "Meditation", icon: "🧘🏼‍♀️️", desc: "A cozy way to relax, ease stress, and sleep better by soothing the mind and embracing mindfulness", isRemind: false, date: Date()),
            DailyHabbit(name: "Hygiene", icon: "😴", desc: "Your bedtime buddies for a fresher, more relaxed sleep and a healthier you💆‍♀️", isRemind: false, date: Date()),
            DailyHabbit(name: "Journaling", icon: "📝", desc: "Hey, how's your day going? Or do you have anything on your mind? Care to share?", isRemind: false, date: Date()),
            DailyHabbit(name: "Limit Screen Time", icon: "📱", desc: "Give screens a break at least an hour before bed. Their blue light can mess with your sleep.", isRemind: false, date: Date()),
            DailyHabbit(name: "Step", icon: "🏃🏻‍♂️", desc: "Boost your sleep quality by adding daily steps to your routine. A little physical activity can harmonize your body's internal clock and improve your restful nights. Keep moving for better sleep!", isRemind: false, date: Date())
        ]
        
        // Creating and saving sample data
        for habit in dailyHabbitArr {
            let newItem = DailyHabits(context: context)
            newItem.id = UUID()
            newItem.name = habit.name
            newItem.desc = habit.desc
            newItem.icon = habit.icon
            newItem.isRemind = habit.isRemind
            newItem.date = habit.date
        }
        
        // Save the context
        do {
            try context.save()
            print("Initial data seeded.")
        } catch {
            fatalError("Failed to save initial data: \(error)")
        }
    }
    
    func fetchDailyHabit(name: String) -> DailyHabits {
        let context = container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyHabits")
        
        // Set up a predicate to filter by propertie
        
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate = predicate
        do {
            let result = try context.fetch(request)
            if let firstResult = result.first {
                // Use firstResult, which is the first record in the entity
                return firstResult as! DailyHabits
            } else {
                // Handle the case where no data is found
                print("No data found")
            }
        } catch {
            print("Error fetching user: \(error)")
        }
        
        return DailyHabits()
    }
}
