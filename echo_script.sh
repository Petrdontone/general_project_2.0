echo "Start all autotests"
n=10
for (( i = 0; i < n; i++ )); do
    echo "$i"
done

boolean_value=5
while [[ $boolean_value -gt 0 ]]; do
    echo "boolean_value"
    boolean_value=$((boolean_value-1))
done

echo "Finished all tests"