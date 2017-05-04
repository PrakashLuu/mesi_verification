Prakash Luu and Barak Lidsky


Mesi Verification Project


Mainly, we wrote "assertions" in the small testbench that was already provided and also did formal verification with Jaspergold.

We tried writing assertions into mesi_isc_tb but were unable to get them to run with iVerilog. Because of this, we instead used if statements that ran alongside a sanity check of theirs to make sure the cache coherancy never got into an illegal state. With this, we simulated a large number of inputs to make sure we hit a lot of the states.

To try to formally prove that the coherancy controller was executing as intended, we created assertions in a module that was wrapped around the mesi_isc module. By wrapping this module, we were able to check whether the module was correctly inputting/outputting signals to the caches it controlled. 


To use Jaspergold, simply run our project.tcl script in Jaspergold and it should add all the rtl plus jgtest.sv which is our systemverilog file with all our assertions. 

To run the regular testbench, we have an additional folder called mesi_isc/trunk/sim and execute the command "./run_sim". This will run a testbench with iVerilog. 