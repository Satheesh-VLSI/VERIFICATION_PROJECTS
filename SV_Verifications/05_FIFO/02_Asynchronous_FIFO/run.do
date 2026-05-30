run -all
# Save the database
coverage save cov.ucdb
# Just run the report once, directly to the log
coverage report -cvg -details
# Exit the simulator immediately
exit

#compiler option: -timescale 1ns/1ns -coverage
#run option: -coverage -voptargs="+acc" 
