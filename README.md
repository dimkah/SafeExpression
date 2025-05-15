# SafeExpression

SafeExpression is a small Swift package that safely wraps `NSExpression(format:)`, protecting your app from crashes caused by malformed expressions. If parsing fails, the wrapper throws a Swift `Error` instead of crashing.

## 🔐 Why?

Apple's `NSExpression(format:)` can crash your app if you pass an invalid format string. `SafeExpression` prevents that by catching Objective-C exceptions and converting them into Swift `throws`.

---

## ✅ Features

- Safe parsing of format strings
- Throws descriptive errors instead of crashing
- Usable in 100% Swift projects (no need for bridging headers)

## 🔧 Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
.package(url: "https://github.com/dimkah/SafeExpression.git", from: "1.0.0")
```

### Xcode

1. Open your project in Xcode.
2. Go to `File` > `Swift Packages` > `Add Package Dependency`.
3. Enter the URL: `https://github.com/dimkah/SafeExpression.git`.
4. Choose the version you want to use (e.g., `1.0.0`).

## ✅ Usage

### Import the module

```swift
import SafeExpression
```

### Create a SafeExpression

```swift
do {
    let expression = try SafeExpressionWrapper.expression(format: "(5 + 2 * 3") // Invalid format (missing closing parenthesis)
    let result = expression.expressionValue(with: nil, context: nil)
    print("Result:", result ?? "nil") // Will not be reached since the expression is invalid
} catch {
    print("Expression error:", error.localizedDescription) // Handle the error
    // Output: Expression error: Invalid expression format
    // or similar error message
    // depending on the specific issue with the format string.
}
```

## 💡 Why use SafeExpression?

### Without SafeExpression:

```swift
let expression = NSExpression(format: "5 + (2 *") // 💥 Crash!
```

### With SafeExpression:

```swift
do {
    let expression = try SafeExpressionWrapper.expression(format: "5 + (2 *")
} catch {
    print("Invalid expression:", error.localizedDescription)
}
```

✅ No crash — just a regular Swift error.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you find a bug or have a feature request.
