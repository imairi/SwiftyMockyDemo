// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.3.1

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import Foundation
@testable import SwiftyMockyDemo
#if MockyCustom
    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression(), message(), file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#else
    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        #if canImport(XCTest)
        XCTAssert(expression(), message(), file: file, line: line)
        #else 
        assert(expression(), message(), file: file, line: line)
        #endif
    }
#endif


// MARK: - User
open class UserMock: User, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var name: String {
		get {	invocations.append(.p_name_get); return __p_name ?? givenGetterValue(.p_name_get, "UserMock - stub value for name was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_name = newValue }
	}
	private var __p_name: (String)?

    public var age: Int {
		get {	invocations.append(.p_age_get); return __p_age ?? givenGetterValue(.p_age_get, "UserMock - stub value for age was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_age = newValue }
	}
	private var __p_age: (Int)?





    open func profile() -> String {
        addInvocation(.m_profile)
		let perform = methodPerformValue(.m_profile) as? () -> Void
		perform?()
		var __value: String
		do {
		    __value = try methodReturnValue(.m_profile).casted()
		} catch {
			onFatalFailure("Stub return value not specified for profile(). Use given")
			Failure("Stub return value not specified for profile(). Use given")
		}
		return __value
    }

    open func update(age: Int) {
        addInvocation(.m_update__age_age(Parameter<Int>.value(`age`)))
		let perform = methodPerformValue(.m_update__age_age(Parameter<Int>.value(`age`))) as? (Int) -> Void
		perform?(`age`)
    }

    open func update(name: String, completion:(() -> Void)) {
        addInvocation(.m_update__name_namecompletion_completion(Parameter<String>.value(`name`), Parameter<() -> Void>.any))
		let perform = methodPerformValue(.m_update__name_namecompletion_completion(Parameter<String>.value(`name`), Parameter<() -> Void>.any)) as? (String, (() -> Void)) -> Void
		perform?(`name`, `completion`)
    }


    fileprivate enum MethodType {
        case m_profile
        case m_update__age_age(Parameter<Int>)
        case m_update__name_namecompletion_completion(Parameter<String>, Parameter<() -> Void>)
        case p_name_get
        case p_age_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_profile, .m_profile):
                return true 
            case (.m_update__age_age(let lhsAge), .m_update__age_age(let rhsAge)):
                guard Parameter.compare(lhs: lhsAge, rhs: rhsAge, with: matcher) else { return false } 
                return true 
            case (.m_update__name_namecompletion_completion(let lhsName, let lhsCompletion), .m_update__name_namecompletion_completion(let rhsName, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.p_name_get,.p_name_get): return true
            case (.p_age_get,.p_age_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_profile: return 0
            case let .m_update__age_age(p0): return p0.intValue
            case let .m_update__name_namecompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case .p_name_get: return 0
            case .p_age_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func name(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_name_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func age(getter defaultValue: Int...) -> PropertyStub {
            return Given(method: .p_age_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func profile(willReturn: String...) -> MethodStub {
            return Given(method: .m_profile, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func profile(willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_profile, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func profile() -> Verify { return Verify(method: .m_profile)}
        public static func update(age: Parameter<Int>) -> Verify { return Verify(method: .m_update__age_age(`age`))}
        public static func update(name: Parameter<String>, completion: Parameter<() -> Void>) -> Verify { return Verify(method: .m_update__name_namecompletion_completion(`name`, `completion`))}
        public static var name: Verify { return Verify(method: .p_name_get) }
        public static var age: Verify { return Verify(method: .p_age_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func profile(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_profile, performs: perform)
        }
        public static func update(age: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_update__age_age(`age`), performs: perform)
        }
        public static func update(name: Parameter<String>, completion: Parameter<() -> Void>, perform: @escaping (String, (() -> Void)) -> Void) -> Perform {
            return Perform(method: .m_update__name_namecompletion_completion(`name`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

