module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire ena_mm = ena && (ss == 8'h59);
    wire ena_hh = ena_mm && (mm == 8'h59);
    
    always @(posedge clk) begin
        if(reset) begin
           hh <= 8'h12;
           mm <= 8'h00;
           ss <= 8'h00;
           pm <= 1'b0;
        end else begin
            
            if(ena) begin
                if(ss == 8'h59) begin
                   ss <= 8'h00; 
                end else if (ss[3:0] == 4'h9)begin
                    ss <= {ss[7:4] + 4'h1, 4'h0};
                end else begin
                    ss <= {ss[7:4], ss[3:0] + 4'h1};
                end
            end
            
            if(ena_mm) begin
                if(mm == 8'h59) begin
                   mm <= 8'h00; 
                end else if (mm[3:0] == 4'h9)begin
                    mm <= {mm[7:4] + 4'h1, 4'h0};
                end else begin
                    mm <= {mm[7:4], mm[3:0] + 4'h1};
                end
            end
            
            if(ena_hh) begin
                if(hh == 8'h11) begin
                    hh <= 8'h12; 
                    pm <= ~pm;
                end else if (hh == 8'h12) begin
                    hh <= 8'h1;
                end else if (hh[3:0] == 4'h9)begin
                    hh <= {hh[7:4] + 4'h1, 4'h0};
                end else begin
                    hh <= {hh[7:4], hh[3:0] + 4'h1};
                end
            end
        end
    end

endmodule