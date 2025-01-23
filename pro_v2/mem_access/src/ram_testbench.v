//-----------------------------------------------------------------------------
//
// Title       : ram_testbench
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/ram_testbench.v
// Generated   : Fri Jan 17 23:48:18 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
/*
`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {ram_testbench}}

module ram_testbench;
    reg [2:0] address;       // 3-bit address for RAM
    //reg [3:0] data_in;       // 4-bit input data
    reg write_enable, read_enable, reset;
    wire [3:0] data_out;     // 4-bit output data
    reg clk;
	reg [3:0] poly, data_in;
	reg [2:0]  zeroes,crc_out;

    // Instantiate Clock Generator
   // clock_generator clk_gen (.clk(clk));
	CRC crc (clk, zeroes , data_in, crc_out);
    // Instantiate RAM
     ram_8x4 ram_inst (
        clk, 
        reset, 
        address, 
        data_in, 
        write_enable, 
        read_enable, 
        data_out
    );
	initial begin
        clk = 0;
        forever #4 clk = ~clk;
    end
    initial begin
        // Display signals in the console
        $monitor("Time: %0t | Reset: %b | Addr: %b | WriteEn: %b | ReadEn: %b | DataOut: %b",
                  $time, reset, address, write_enable, read_enable, data_out);

        // Initialize signals
        reset = 1;
        write_enable = 0;
        read_enable = 0;
        address = 3'b000;
       // data_in = 4'b0000;
		poly = 4'b1001;  // Example polynomial
        zeroes = 4'b0000;
       // data_in = 4'b1111;
        // Reset the RAM
        #10 reset = 0;  // Release reset
       // #10 reset = 1;  // Assert reset
       // #10 reset = 0;  // Deactivate reset

	   // Write data to address 3 
	    #10 address = 3'b011; data_in =4'b1111; write_enable = 1; 
        #100 address = 3'b100; data_in =crc_out; write_enable = 1;

        // Disable write, enable read to verify data
        #10 write_enable = 0; read_enable = 1;
        #10 address = 3'b011;
		#10 write_enable = 0; read_enable = 1;
        #10 address = 3'b100;
		/*
        // Write data to another address (e.g., address 2)
        #10 address = 3'b010; data_in = 4'b1100; write_enable = 1; read_enable = 0;

        // Disable write, read data from address 2
        #10 write_enable = 0; read_enable = 1;
        #10 address = 3'b010;

        // Verify data from a different address (e.g., address 1)
        #10 address = 3'b001; read_enable = 1;
		  */
        // End simulation
       /* #200 $stop;
    end
endmodule

*/
`timescale 1ps / 1ps

module ram_testbench;
    reg [2:0] address;       // 3-bit address for RAM
    reg write_enable, read_enable, reset;
    wire [3:0] data_out;     // 4-bit output data
    reg clk;
    reg [3:0] poly, data_in;
    reg [2:0] zeroes, crc_out; 
	reg [3:0] data_var1, data_var2, recal_crc;	
	wire comp_lt, comp_eq, comp_gt;

    // Instantiate CRC Module
    CRC crc (
	.clk(clk),
	.poly(poly)	 ,
        .zeroes(zeroes),
        .data_in(data_in),
        .crc_out(crc_out)
    );

    // Instantiate RAM
    ram_8x4 ram_inst (
        .clk(clk),
        .reset(reset),
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .data_out(data_out)
    );	
	// Instantiate Comparator
    Comparator_4bit comparator (
        .A(data_var2),  // First input to comparator
        .B(recal_crc),  // Second input to comparator
        .C(comp_lt),    // Output: A < B
        .D(comp_eq),    // Output: A = B
        .E(comp_gt)     // Output: A > B
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #4 clk = ~clk;
    end

    initial begin
        // Initialize signals
        reset = 1;
        write_enable = 0;
        read_enable = 0;
        address = 3'b000;
        poly = 4'b1001;      // Example polynomial
        zeroes = 3'b000;
        
        // Reset the RAM
        #10 reset = 0;

        // Write data to address 3
        #10 address = 3'b011; data_in = 4'b1111; write_enable = 1;
        #10 write_enable = 0;

        // Wait for CRC calculation
        #80 address = 3'b100; data_in = {1'b0, crc_out}; write_enable = 1; // Store CRC padded to 4 bits
        #10 write_enable = 0;

        // Step 3: Read data from address 3
        #10 read_enable = 1; address = 3'b011;
        #10 data_var1 = data_out;  // Save data_out to data_var1
        $display("Read Data from address %b: %b", address, data_var1);

        // Step 4: Read CRC from address 4
        #10 address = 3'b100;
        #10 data_var2 = data_out;  // Save data_out to data_var2
        $display("Read CRC from address %b: %b", address, data_var2);
		
		// Step 5: Recalculate CRC for data_var1
        #10 data_in = data_var1;  // Feed data_var1 into CRC
        #80 $display("Recalculated CRC for Data %b: %b", data_var1, crc_out); 
		recal_crc	= 	{1'b0, crc_out};
        $display("Recalculated CRC is %b",recal_crc);	
		
		// Step 6: Compare data_var2 and recal_crc
        #10;
        $display("Comparing data_var2 (%b) and recal_crc (%b):", data_var2, recal_crc);
        $display("A < B: %b | A = B: %b | A > B: %b", comp_lt, comp_eq, comp_gt);
        
        // End simulation
        #10 $stop;
    end
endmodule
