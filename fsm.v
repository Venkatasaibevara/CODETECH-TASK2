module fsm(
    input clk,
    input reset,
    input in,
    output reg out
);

// Define states
localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;

reg [1:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= S0;
    end else begin
        current_state <= next_state;
    end
end

always @(*) begin
    case (current_state)
        S0: begin
            if (in) begin
                next_state = S1;
            end else begin
                next_state = S0;
            end
            out = 0;
        end
        S1: begin
            if (in) begin
                next_state = S2;
            end else begin
                next_state = S0;
            end
            out = 1;
        end
        S2: begin
            if (in) begin
                next_state = S1;
            end else begin
                next_state = S0;
            end
            out = 0;
        end
    endcase
end

endmodule