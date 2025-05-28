module bit_checker_tb;

    // Signals
    logic clk;
    logic rst;
    logic [9:0] input_vector;
    logic [3:0] current_index;
    logic is_one;
    logic done;

    // Instantiate the module under test (UUT)
    bit_checker_sequential uut (
        .clk(clk),
        .rst(rst),
        .input_vector(input_vector),
        .current_index(current_index),
        .is_one(is_one),
        .done(done)
    );

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus and monitoring
    initial begin
        $display("Starting simulation...");

        // Step 1: Apply reset
        rst = 1;
        input_vector = 10'b1011001001; // Example input
        #10 rst = 0; // Release reset at 10ns

        // Step 2: Wait for next posedge clk to ensure system starts from index 0
        @(posedge clk);
        $display("Bit %0d = %0b | is_one: %0b | done: %0b", 
                 current_index, input_vector[current_index], is_one, done);

        // Step 3: Now continue monitoring for remaining bits
        repeat (9) begin
            @(posedge clk);
            $display("Bit %0d = %0b | is_one: %0b | done: %0b", 
                     current_index, input_vector[current_index], is_one, done);
        end

        $display("Simulation finished.");
        $finish;
    end

endmodule
