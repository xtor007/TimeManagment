// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Authcheck {
    /// signIn
    internal static let signIn = Strings.tr("Localizable", "authcheck.signIn", fallback: "signIn")
  }
  internal enum Db {
    /// uid
    internal static let uid = Strings.tr("Localizable", "db.uid", fallback: "uid")
  internal enum ChangeEvent {
    /// Create Event
    internal static let add = Strings.tr("Localizable", "changeEvent.add", fallback: "Create Event")
    /// Choose categories
    internal static let chooseCategories = Strings.tr("Localizable", "changeEvent.chooseCategories", fallback: "Choose categories")
    /// Continue
    internal static let `continue` = Strings.tr("Localizable", "changeEvent.continue", fallback: "Continue")
    /// Delete task
    internal static let delete = Strings.tr("Localizable", "changeEvent.delete", fallback: "Delete task")
    /// Description
    internal static let description = Strings.tr("Localizable", "changeEvent.description", fallback: "Description")
    /// Add notes, meeting links or phone numbers...
    internal static let descriptionPlaceholder = Strings.tr("Localizable", "changeEvent.descriptionPlaceholder", fallback: "Add notes, meeting links or phone numbers...")
    /// Edit Event
    internal static let edit = Strings.tr("Localizable", "changeEvent.edit", fallback: "Edit Event")
    /// Enter event title
    internal static let enterTitle = Strings.tr("Localizable", "changeEvent.enterTitle", fallback: "Enter event title")
    /// Update Task
    internal static let updateTask = Strings.tr("Localizable", "changeEvent.updateTask", fallback: "Update Task")
  }
  internal enum EventType {
    /// Funning
    internal static let funning = Strings.tr("Localizable", "eventType.funning", fallback: "Funning")
    /// Learning
    internal static let learning = Strings.tr("Localizable", "eventType.learning", fallback: "Learning")
    /// Meeting
    internal static let meeting = Strings.tr("Localizable", "eventType.meeting", fallback: "Meeting")
    /// Partey
    internal static let partey = Strings.tr("Localizable", "eventType.partey", fallback: "Partey")
    /// Shoping
    internal static let shoping = Strings.tr("Localizable", "eventType.shoping", fallback: "Shoping")
    /// Sport
    internal static let sport = Strings.tr("Localizable", "eventType.sport", fallback: "Sport")
    /// Walking
    internal static let walking = Strings.tr("Localizable", "eventType.walking", fallback: "Walking")
  }
  internal enum General {
    /// This list is empty
    internal static let empty = Strings.tr("Localizable", "general.empty", fallback: "This list is empty")
    /// Localizable.strings
    ///   TimeManagment
    /// 
    ///   Created by Anatoliy Khramchenko on 31.01.2023.
    internal static let simpleLine = Strings.tr("Localizable", "general.simpleLine", fallback: "simle line")
  }
  internal enum Icon {
    /// checkmark
    internal static let checkmark = Strings.tr("Localizable", "icon.checkmark", fallback: "checkmark")
    /// mail
    internal static let email = Strings.tr("Localizable", "icon.email", fallback: "mail")
    /// lock
    internal static let lock = Strings.tr("Localizable", "icon.lock", fallback: "lock")
    /// xmark
    internal static let xmark = Strings.tr("Localizable", "icon.xmark", fallback: "xmark")
  }
  internal enum Login {
    /// Don't have an account?
    internal static let createAccount = Strings.tr("Localizable", "login.createAccount", fallback: "Don't have an account?")
    /// Sign In
    internal static let signin = Strings.tr("Localizable", "login.signin", fallback: "Sign In")
    /// Welcome to Task Manager! 
    internal static let welcomeBack = Strings.tr("Localizable", "login.welcomeBack", fallback: "Welcome to Task Manager! ")
  }
  internal enum Placeholder {
    /// Email
    internal static let email = Strings.tr("Localizable", "placeholder.email", fallback: "Email")
    /// Password
    internal static let password = Strings.tr("Localizable", "placeholder.password", fallback: "Password")
  }
  internal enum Signout {
    /// Sign Out
    internal static let signout = Strings.tr("Localizable", "signout.signout", fallback: "Sign Out")
  }
  internal enum Signup {
    /// Already have an account?
    internal static let alreadyHave = Strings.tr("Localizable", "signup.alreadyHave", fallback: "Already have an account?")
    /// Create an account!
    internal static let createAccount = Strings.tr("Localizable", "signup.createAccount", fallback: "Create an account!")
    /// Create new account
    internal static let createNew = Strings.tr("Localizable", "signup.createNew", fallback: "Create new account")
  }
  internal enum Temp {
    /// Error signing out: 
    internal static let errorAuth = Strings.tr("Localizable", "temp.errorAuth", fallback: "Error signing out: ")
    /// Logged In! 
    /// Your user id is
    internal static let loggedin = Strings.tr("Localizable", "temp.loggedin", fallback: "Logged In! \nYour user id is")
  internal enum Main {
    /// Personal calendar
    internal static let calendar = Strings.tr("Localizable", "main.calendar", fallback: "Personal calendar")
    /// Events
    internal static let events = Strings.tr("Localizable", "main.events", fallback: "Events")
  }
  internal enum SelectTimePeriod {
    /// Finish
    internal static let finish = Strings.tr("Localizable", "selectTimePeriod.finish", fallback: "Finish")
    /// Start
    internal static let start = Strings.tr("Localizable", "selectTimePeriod.start", fallback: "Start")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
