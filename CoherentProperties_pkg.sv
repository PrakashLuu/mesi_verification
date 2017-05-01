package CoherentProperties;

    property ValidEx(clk, membus, core0, core1, core2, core3);
        @(posedge clk) core0.cache_state[membus] == 

endpackage: CoherentProperties
