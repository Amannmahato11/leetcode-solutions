class Solution {
public: 
    bool checkValidString(string s) {
        vector<vector<int>> memo(s.size(), vector<int>(s.size(), -1));
        return isValidString(0, 0, s, memo);
    }
private: 
    bool isValidString(int index, int openCount,
        const string & str, vector < vector < int >> & memo) {
        // If reached end of the string, check if all brackets are balanced
        if (index == str.size()) {
            return (openCount == 0);
        }

        // If already computed, return memoized result
        if (memo[index][openCount] != -1) {
            return memo[index][openCount];
        }

        bool isValid = false;
        // If encountering '*', try all possibilities
        if (str[index] == '*') {
            isValid |= isValidString(index + 1, openCount + 1, str, memo); // Treat '*' as '('
            if (openCount) {
                isValid |= isValidString(index + 1, openCount - 1, str, memo); // Treat '*' as ')'
            }
            isValid |= isValidString(index + 1, openCount, str, memo); // Treat '*' as empty
        } else {
            // Handle '(' and ')'
            if (str[index] == '(') {
                isValid = isValidString(index + 1, openCount + 1, str, memo); // Increment count for '('
            } else if (openCount) {
                isValid = isValidString(index + 1, openCount - 1, str, memo); // Decrement count for ')'
            }
        }

        // Memoize and return the result
        return memo[index][openCount] = isValid;
    }
};