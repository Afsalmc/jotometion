jmeter -n -t jmx.jmx -l testResults.jtl -j jmeter.log

JMeterPluginsCMD.sh --generate-csv aggregateResults.csv --input-jtl testResults.jtl --plugin-type AggregateReport

JMeterPluginsCMD.sh --generate-png aggregateResults.png --input-jtl testResults.jtl --plugin-type ResponseTimesOverTime --width 800 --height 600

cat table.html | mutt -e "set content_type=text/html" -a aggregateResults.png -s "Scheduler loadtest" -- afsalrahman@carestack.com

echo "ELLLLLLLLLLLLLLLLLLLLAAAAAAAAm SUBHAM!!!!!!!!!!!!!!!!!!!!"