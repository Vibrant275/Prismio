"""
Script to extract individual test files from the comprehensive test suite.
Run this once to create all test files.
"""

tests = {
    "test_01_variables.psm": """let x = 5
let y = 10
let mut z = 0

fn test_arithmetic() -> Int {
    let a = x + y
    let b = x * y
    let c = y - x
    let d = y / x
    let e = y % x
    return a + b + c + d + e
}

fn main() {
    let result = test_arithmetic()
    println("Test 1: Variables and Arithmetic")
    println("Expected: 72")
    println("Got:")
    println(result)
}""",

    "test_02_if_else.psm": """fn max(a: Int, b: Int) -> Int {
    if (a > b) {
        return a
    } else {
        return b
    }
}

fn test_nested_if(x: Int) -> Int {
    if (x > 10) {
        if (x > 20) {
            return 2
        } else {
            return 1
        }
    } else {
        return 0
    }
}

fn main() {
    let result1 = max(5, 10)
    let result2 = test_nested_if(15)
    println("Test 2: If/Else")
    println("max(5,10) expected: 10, got:")
    println(result1)
    println("nested_if(15) expected: 1, got:")
    println(result2)
}""",

    "test_03_while_loops.psm": """fn sum_to_n(n: Int) -> Int {
    let mut sum = 0
    let mut i = 0
    
    while (i < n) {
        sum = sum + i
        i = i + 1
    }
    
    return sum
}

fn factorial(n: Int) -> Int {
    let mut result = 1
    let mut i = 1
    
    while (i <= n) {
        result = result * i
        i = i + 1
    }
    
    return result
}

fn main() {
    let sum = sum_to_n(10)
    let fact = factorial(5)
    println("Test 3: While Loops")
    println("sum_to_n(10) expected: 45, got:")
    println(sum)
    println("factorial(5) expected: 120, got:")
    println(fact)
}""",

    "test_04_structs.psm": """struct Token {
    type: Int,
    value: Int,
    line: Int
}

struct Lexer {
    position: Int,
    line: Int
}

fn main() {
    println("Test 4: Structs")
}""",

    "test_05_enums.psm": """enum TokenType {
    Number,
    String,
    Identifier,
    Keyword,
    Operator
}

enum NodeType {
    BinaryExpr,
    UnaryExpr,
    Literal,
    Variable
}

fn main() {
    println("Test 5: Enums")
}""",

    "test_06_recursion.psm": """fn fibonacci(n: Int) -> Int {
    if (n <= 1) {
        return n
    } else {
        let a = fibonacci(n - 1)
        let b = fibonacci(n - 2)
        return a + b
    }
}

fn gcd(a: Int, b: Int) -> Int {
    if (b == 0) {
        return a
    } else {
        return gcd(b, a % b)
    }
}

fn main() {
    let fib10 = fibonacci(10)
    let gcd_val = gcd(48, 18)
    println("Test 6: Recursion")
    println("fibonacci(10) expected: 55, got:")
    println(fib10)
    println("gcd(48, 18) expected: 6, got:")
    println(gcd_val)
}""",

    "test_07_booleans.psm": """fn test_comparisons(a: Int, b: Int) -> Int {
    if (a == b) {
        return 1
    } else {
        return 0
    }
}

fn main() {
    let result = test_comparisons(5, 10)
    println("Test 7: Booleans")
}""",

    "test_08_mutability.psm": """fn test_mutation() -> Int {
    let mut counter = 0
    
    counter = counter + 1
    counter = counter + 2
    counter = counter + 3
    
    return counter
}

fn test_complex_mutation() -> Int {
    let mut x = 10
    let mut y = 20
    
    x = x + y
    y = x - y
    x = x - y
    
    return x + y
}

fn main() {
    let result1 = test_mutation()
    let result2 = test_complex_mutation()
    println("Test 8: Mutability")
    println("test_mutation() expected: 6, got:")
    println(result1)
    println("test_complex_mutation() expected: 30, got:")
    println(result2)
}""",

    "test_09_strings.psm": """fn test_strings() {
    let msg1 = "Hello"
    let msg2 = "World"
    let msg3 = "Compiler"
    
    println(msg1)
    println(msg2)
    println(msg3)
}

fn main() {
    test_strings()
    println("Test 9: Strings")
}""",

    "test_10_expressions.psm": """fn eval_expression(x: Int, y: Int, z: Int) -> Int {
    let result = x + y * z - x / y + z % x
    return result
}

fn nested_expressions() -> Int {
    let a = 5
    let b = 10
    let c = 15
    
    let result = (a + b) * (c - a) / (b - a)
    return result
}

fn main() {
    let result1 = eval_expression(10, 5, 3)
    let result2 = nested_expressions()
    println("Test 10: Complex Expressions")
    println("eval_expression(10,5,3) expected: 20, got:")
    println(result1)
    println("nested_expressions() expected: 30, got:")
    println(result2)
}""",

    "test_11_returns.psm": """fn classify_number(n: Int) -> Int {
    if (n < 0) {
        return 0
    } else {
        if (n == 0) {
            return 1
        } else {
            if (n < 10) {
                return 2
            } else {
                return 3
            }
        }
    }
}

fn early_return(x: Int) -> Int {
    if (x < 0) {
        return 0
    }
    
    if (x == 0) {
        return 1
    }
    
    return x * 2
}

fn main() {
    let r1 = classify_number(5)
    let r2 = early_return(10)
    println("Test 11: Multiple Returns")
}""",

    "test_12_imports.psm": """import prismio.io
import prismio.lexer
import prismio.parser

fn main() {
    println("Test 12: Imports")
}""",

    "test_13_globals.psm": """let BUFFER_SIZE = 1024
let MAX_TOKENS = 10000
let mut global_counter = 0

fn use_globals() -> Int {
    global_counter = global_counter + 1
    return BUFFER_SIZE + MAX_TOKENS + global_counter
}

fn main() {
    let result = use_globals()
    println("Test 13: Globals")
}""",

    "test_14_multi_args.psm": """fn add3(a: Int, b: Int, c: Int) -> Int {
    return a + b + c
}

fn add4(a: Int, b: Int, c: Int, d: Int) -> Int {
    return a + b + c + d
}

fn add5(a: Int, b: Int, c: Int, d: Int, e: Int) -> Int {
    return a + b + c + d + e
}

fn nested_calls(x: Int) -> Int {
    let r1 = add3(x, x + 1, x + 2)
    let r2 = add4(r1, x, x + 1, x + 2)
    let r3 = add5(r2, x, x + 1, x + 2, x + 3)
    return r3
}

fn main() {
    let result = nested_calls(5)
    println("Test 14: Multiple Arguments")
}""",

    "test_15_compiler_sim.psm": """struct Token {
    type: Int,
    value: Int,
    line: Int
}

struct Parser {
    position: Int,
    token_count: Int
}

fn create_token(t: Int, v: Int, l: Int) -> Int {
    return t + v + l
}

fn tokenize(input: Int) -> Int {
    let mut count = 0
    let mut pos = 0
    
    while (pos < input) {
        let tok = create_token(1, pos, 1)
        count = count + 1
        pos = pos + 1
    }
    
    return count
}

fn parse(token_count: Int) -> Int {
    let mut parsed = 0
    let mut i = 0
    
    while (i < token_count) {
        if (i % 2 == 0) {
            parsed = parsed + 1
        }
        i = i + 1
    }
    
    return parsed
}

fn compile(input_size: Int) -> Int {
    let tokens = tokenize(input_size)
    let ast_nodes = parse(tokens)
    return ast_nodes
}

fn main() {
    let result = compile(100)
    println("Test 15: Compiler Simulation")
}"""
}

def main():
    print("Creating test files...")

    for filename, content in tests.items():
        with open(filename, 'w') as f:
            f.write(content)
        print(f"  ✓ Created {filename}")

    print(f"\n✓ Created {len(tests)} test files")
    print("\nRun 'python test_runner.py' to execute all tests")

if __name__ == "__main__":
    main()