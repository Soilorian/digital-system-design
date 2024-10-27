module SRFF (
    S, R, clk, SET, CLR,
    Q, Q_not
);

input  wire S, R, clk, SET, CLR;
output reg Q, Q_not;

always @ (posedge clk or negedge CLR or negedge SET)begin
    if(~CLR)
        Q <= 0;
    else if(~SET)
        Q <= 1;
    else begin
        case({S,R})
            2'b00:
                Q <= Q;
            2'b01:
                Q <= 0;
            2'b10:
                Q <= 1;
            2'b11:
                Q <= 1'bx;
            default:
                Q <= Q;
        endcase
    end
    Q_not <= ~Q;
end
    
endmodule