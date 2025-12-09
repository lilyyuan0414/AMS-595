#include <iostream>
#include <vector>
using namespace std;

// Section 2: print a vector
void print_vector(vector<int> v) {
    for (size_t i = 0; i < v.size(); i++) {
        cout << v[i];
        if (i < v.size() - 1) {
            cout << " ";
        }
    }
    cout << endl;
}

// Section 3: print Fibonacci numbers up to 4,000,000
void print_fibonacci() {
    int a = 1;
    int b = 2;

    // print the first two numbers
    cout << a << " " << b;

    // generate more Fibonacci numbers
    while (true) {
        int next = a + b;

        // stop once next number is too big
        if (next > 4000000) {
            break;
        }

        cout << " " << next;

        // move ahead in the sequence
        a = b;
        b = next;
    }

    cout << endl;
}

// Section 4.1: check if a number is prime
bool isprime(int n) {
    bool result;

    if (n < 2) {
        result = false;
    } else {
        result = true;

        // try dividing by every number from 2 to n-1
        for (int i = 2; i < n; i++) {
            if (n % i == 0) {
                result = false;
                break;
            }
        }
    }

    return result;
}

// test for isprime
void test_isprime() {
    cout << "isprime(2) = " << isprime(2) << endl;
    cout << "isprime(10) = " << isprime(10) << endl;
    cout << "isprime(17) = " << isprime(17) << endl;
}

// Section 4.2: list all factors of n
vector<int> factorize(int n) {
    vector<int> answer;

    if (n <= 0) {
        return answer;
    }

    for (int i = 1; i <= n; i++) {
        if (n % i == 0) {
            answer.push_back(i);
        }
    }

    return answer;
}

// test for factorize
void test_factorize() {
    print_vector(factorize(2));
    print_vector(factorize(72));
    print_vector(factorize(196));
}

// Section 4.3: prime factorization
vector<int> prime_factorize(int n) {
    vector<int> answer;

    if (n < 2) {
        return answer;
    }

    int i = 2;

    // keep dividing n when possible
    while (i <= n) {
        if (n % i == 0) {
            answer.push_back(i);
            n = n / i;
        } else {
            i++;
        }
    }

    return answer;
}

// test for prime_factorize
void test_prime_factorize() {
    print_vector(prime_factorize(2));
    print_vector(prime_factorize(72));
    print_vector(prime_factorize(196));
}

// Section 5: print the first n rows of Pascal's Triangle
void print_pascal(int n) {
    if (n <= 0) {
        return;
    }

    // first row is just [1]
    vector<int> row = {1};
    print_vector(row);

    // build and print each new row
    for (int i = 1; i < n; i++) {
        vector<int> next;

        next.push_back(1); // first number

        // middle numbers are sums of two numbers above
        for (int j = 0; j < static_cast<int>(row.size()) - 1; j++) {
            next.push_back(row[j] + row[j + 1]);
        }

        next.push_back(1); // last number

        print_vector(next);
        row = next;
    }
}

// Section 1: main program
int main() {
    int n;

    // ask the user for a number
    cout << "Enter a number: ";
    cin >> n;

    // print the corresponding word
    switch (n) {
        case -1:
            cout << "negative one" << endl;
            break;
        case 0:
            cout << "zero" << endl;
            break;
        case 1:
            cout << "positive one" << endl;
            break;
        default:
            cout << "other value" << endl;
            break;
    }

    // test Section 2
    vector<int> nums = {2, 4, 6, 8};
    cout << "Testing print_vector: ";
    print_vector(nums);

    // test Section 3
    cout << "Fibonacci numbers up to 4,000,000: ";
    print_fibonacci();

    // test Section 4
    cout << "Testing isprime:" << endl;
    test_isprime();

    cout << "Testing factorize:" << endl;
    test_factorize();

    cout << "Testing prime_factorize:" << endl;
    test_prime_factorize();

    // test Section 5
    cout << "Enter n for Pascal's Triangle: ";
    int p;
    cin >> p;

    cout << "Pascal's Triangle (" << p << " rows):" << endl;
    print_pascal(p);

    return 0;
}
