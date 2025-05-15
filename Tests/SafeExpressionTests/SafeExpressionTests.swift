import XCTest
@testable import SafeExpression

final class SafeExpressionWrapperTests: XCTestCase {

    func testValidExpressionReturnsResult() throws {
        let expr = try SafeExpressionWrapper.expression(format: "5 + 2 * 3")
        let value = expr.expressionValue(with: nil, context: nil) as? NSNumber
        XCTAssertEqual(value?.intValue, 11)
    }

    func testInvalidExpressionThrows1() {
        XCTAssertThrowsError(
            try SafeExpressionWrapper.expression(format: "5 + (2 *")
        ) { error in
            let nsError = error as NSError
            print("Error: \(error.localizedDescription)")
            XCTAssertEqual(nsError.domain, "SafeExpression.Error")
        }
    }

    func testInvalidExpressionThrows2() {
        XCTAssertThrowsError(
            try SafeExpressionWrapper.expression(format: "ї")
        ) { error in
            let nsError = error as NSError
            print("Error: \(error.localizedDescription)")
            XCTAssertEqual(nsError.domain, "SafeExpression.Error")
        }
    }

    func testExpressionWithVariables() throws {
        let expr = try SafeExpressionWrapper.expression(format: "price * quantity")
        let result = expr.expressionValue(with: ["price": 10, "quantity": 3], context: nil) as? NSNumber
        XCTAssertEqual(result?.intValue, 30)
    }


    func testEmptyExpressionThrows() {
        XCTAssertThrowsError(
            try SafeExpressionWrapper.expression(format: "")
        )
    }
}
