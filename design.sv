module bit_checker_sequential (
    input  logic        clk,            // Clock signal
    input  logic        rst,            // Synchronous reset
    input  logic [9:0]  input_vector,   // 10-bit input to be checked
    output logic [3:0]  current_index,  // Current bit index (0 to 9)
    output logic        is_one,         // High if the current bit is 1
    output logic        done            // High when all bits have been checked
);

    logic [3:0] counter; // Counter to keep track of which bit is being checked

    // Sequential block: reacts on rising edge of clk or reset
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            done    <= 0;
        end else if (!done) begin
            if (counter == 9) begin
                done <= 1;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // Output assignments
    assign current_index = counter;
    assign is_one        = input_vector[counter];

endmodule
