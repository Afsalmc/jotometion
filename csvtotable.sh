#!/bin/bash
[[ $# -ne 1 ]] && echo Usage: $0 [CSV_FN] && exit -1

CSV_FN=$1

echo "<html><head>"
echo "<style>th, td { border-style: outset }</style></head>"
echo "<body>"
echo "<h1>Performance test - Profileservice</h1><br>"
echo "Team Please find the results of perf test conducted. check perf metrics to complete evaluation.<br> "
echo "<table>"
head -n 1 $CSV_FN | \
    sed -e 's/^/<tr><th>/' -e 's/,/<\/th><th>/g' -e 's/$/<\/th><\/tr>/'
tail -n +2 $CSV_FN | \
    sed -e 's/^/<tr><td>/' -e 's/,/<\/td><td>/g' -e 's/$/<\/td><\/tr>/'
echo "</table></html>"