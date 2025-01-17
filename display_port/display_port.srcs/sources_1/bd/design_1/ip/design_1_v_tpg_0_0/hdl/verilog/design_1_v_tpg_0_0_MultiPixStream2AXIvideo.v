// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module design_1_v_tpg_0_0_MultiPixStream2AXIvideo (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ovrlayYUV_dout,
        ovrlayYUV_empty_n,
        ovrlayYUV_read,
        height,
        width,
        colorFormat,
        fid_in,
        fid,
        fid_ap_vld,
        field_id,
        m_axis_video_TDATA,
        m_axis_video_TVALID,
        m_axis_video_TREADY,
        m_axis_video_TKEEP,
        m_axis_video_TSTRB,
        m_axis_video_TUSER,
        m_axis_video_TLAST,
        m_axis_video_TID,
        m_axis_video_TDEST
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state6 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [23:0] ovrlayYUV_dout;
input   ovrlayYUV_empty_n;
output   ovrlayYUV_read;
input  [15:0] height;
input  [15:0] width;
input  [7:0] colorFormat;
input  [0:0] fid_in;
output  [0:0] fid;
output   fid_ap_vld;
input  [15:0] field_id;
output  [23:0] m_axis_video_TDATA;
output   m_axis_video_TVALID;
input   m_axis_video_TREADY;
output  [2:0] m_axis_video_TKEEP;
output  [2:0] m_axis_video_TSTRB;
output  [0:0] m_axis_video_TUSER;
output  [0:0] m_axis_video_TLAST;
output  [0:0] m_axis_video_TID;
output  [0:0] m_axis_video_TDEST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ovrlayYUV_read;
reg[0:0] fid;
reg fid_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] counter;
reg    ovrlayYUV_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    m_axis_video_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter2;
reg   [12:0] j_reg_215;
reg   [0:0] sof_3_reg_226;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_state5_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [11:0] trunc_ln912_fu_238_p1;
wire   [12:0] empty_fu_242_p1;
wire  signed [13:0] sub_cast_fu_252_p1;
wire   [15:0] field_id_read_read_fu_148_p2;
wire   [0:0] cmp18187_fu_256_p2;
wire   [0:0] icmp_ln1005_fu_266_p2;
wire   [11:0] i_1_fu_282_p2;
reg   [11:0] i_1_reg_488;
wire    ap_CS_fsm_state2;
wire    regslice_both_AXI_video_strm_V_data_V_U_apdone_blk;
wire   [0:0] icmp_ln957_fu_291_p2;
wire   [12:0] j_1_fu_296_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln962_fu_306_p2;
reg   [0:0] icmp_ln962_reg_507;
wire   [0:0] axi_last_V_fu_311_p2;
reg   [0:0] axi_last_V_reg_511;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [11:0] i_reg_204;
reg    ap_block_state1;
wire    ap_CS_fsm_state6;
reg   [0:0] ap_phi_mux_sof_3_phi_fu_230_p4;
wire   [15:0] add_ln990_fu_319_p2;
reg   [0:0] sof_fu_122;
reg   [15:0] counter_loc_0_fu_126;
reg   [0:0] fid_preg;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] fid_toggle_1_fu_426_p2;
wire   [0:0] fid_toggle_fu_339_p1;
wire   [12:0] sub_fu_246_p2;
wire   [13:0] zext_ln962_fu_302_p1;
wire   [7:0] trunc_ln145_fu_344_p1;
wire   [7:0] trunc_ln145_1_fu_348_p4;
wire   [23:0] p_Result_s_fu_376_p3;
wire   [23:0] p_Result_4_fu_368_p3;
wire   [7:0] trunc_ln145_2_fu_358_p4;
wire   [7:0] select_ln1005_2_fu_398_p3;
wire   [7:0] select_ln1005_1_fu_391_p3;
wire   [23:0] select_ln1005_fu_384_p3;
wire   [15:0] tmp_fu_405_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [23:0] m_axis_video_TDATA_int_regslice;
reg    m_axis_video_TVALID_int_regslice;
wire    m_axis_video_TREADY_int_regslice;
wire    regslice_both_AXI_video_strm_V_data_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_keep_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_keep_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_keep_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_strb_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_strb_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_strb_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_user_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_user_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_user_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_last_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_last_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_last_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_id_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_id_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_id_V_U_vld_out;
wire    regslice_both_AXI_video_strm_V_dest_V_U_apdone_blk;
wire    regslice_both_AXI_video_strm_V_dest_V_U_ack_in_dummy;
wire    regslice_both_AXI_video_strm_V_dest_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 counter = 16'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 fid_preg = 1'd0;
end

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 24 ))
regslice_both_AXI_video_strm_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(m_axis_video_TDATA_int_regslice),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(m_axis_video_TREADY_int_regslice),
    .data_out(m_axis_video_TDATA),
    .vld_out(regslice_both_AXI_video_strm_V_data_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_data_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 3 ))
regslice_both_AXI_video_strm_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(3'd7),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_keep_V_U_ack_in_dummy),
    .data_out(m_axis_video_TKEEP),
    .vld_out(regslice_both_AXI_video_strm_V_keep_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_keep_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 3 ))
regslice_both_AXI_video_strm_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(3'd0),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_strb_V_U_ack_in_dummy),
    .data_out(m_axis_video_TSTRB),
    .vld_out(regslice_both_AXI_video_strm_V_strb_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_strb_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(sof_3_reg_226),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_user_V_U_ack_in_dummy),
    .data_out(m_axis_video_TUSER),
    .vld_out(regslice_both_AXI_video_strm_V_user_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_user_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(axi_last_V_reg_511),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_last_V_U_ack_in_dummy),
    .data_out(m_axis_video_TLAST),
    .vld_out(regslice_both_AXI_video_strm_V_last_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_last_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd0),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_id_V_U_ack_in_dummy),
    .data_out(m_axis_video_TID),
    .vld_out(regslice_both_AXI_video_strm_V_id_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_id_V_U_apdone_blk)
);

design_1_v_tpg_0_0_regslice_both #(
    .DataWidth( 1 ))
regslice_both_AXI_video_strm_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd0),
    .vld_in(m_axis_video_TVALID_int_regslice),
    .ack_in(regslice_both_AXI_video_strm_V_dest_V_U_ack_in_dummy),
    .data_out(m_axis_video_TDEST),
    .vld_out(regslice_both_AXI_video_strm_V_dest_V_U_vld_out),
    .ack_out(m_axis_video_TREADY),
    .apdone_blk(regslice_both_AXI_video_strm_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd1) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        fid_preg <= 1'd0;
    end else begin
        if (((field_id_read_read_fu_148_p2 == 16'd1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            fid_preg <= fid_toggle_fu_339_p1;
        end else if (((field_id_read_read_fu_148_p2 == 16'd3) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            fid_preg <= fid_toggle_1_fu_426_p2;
        end else if (((~(field_id_read_read_fu_148_p2 == 16'd3) & ~(field_id_read_read_fu_148_p2 == 16'd1) & ~(field_id_read_read_fu_148_p2 == 16'd0) & ~(field_id_read_read_fu_148_p2 == 16'd2) & ~(field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((field_id_read_read_fu_148_p2 == 16'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
            fid_preg <= 1'd0;
        end else if (((field_id_read_read_fu_148_p2 == 16'd2) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            fid_preg <= 1'd1;
        end else if (((field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            fid_preg <= fid_in;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        counter_loc_0_fu_126 <= counter;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_phi_mux_sof_3_phi_fu_230_p4 == 1'd1) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        counter_loc_0_fu_126 <= add_ln990_fu_319_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        i_reg_204 <= i_1_reg_488;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_204 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
        j_reg_215 <= 13'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        j_reg_215 <= j_1_fu_296_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
        sof_3_reg_226 <= sof_fu_122;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_reg_507 == 1'd0))) begin
        sof_3_reg_226 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        sof_fu_122 <= 1'd1;
    end else if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        sof_fu_122 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0))) begin
        axi_last_V_reg_511 <= axi_last_V_fu_311_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_phi_mux_sof_3_phi_fu_230_p4 == 1'd1) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        counter <= add_ln990_fu_319_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
        i_1_reg_488 <= i_1_fu_282_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln962_reg_507 <= icmp_ln962_fu_306_p2;
    end
end

always @ (*) begin
    if ((icmp_ln962_fu_306_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd1) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_reg_507 == 1'd0))) begin
        ap_phi_mux_sof_3_phi_fu_230_p4 = 1'd0;
    end else begin
        ap_phi_mux_sof_3_phi_fu_230_p4 = sof_3_reg_226;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd1) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((field_id_read_read_fu_148_p2 == 16'd1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fid = fid_toggle_fu_339_p1;
    end else if (((field_id_read_read_fu_148_p2 == 16'd3) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fid = fid_toggle_1_fu_426_p2;
    end else if (((~(field_id_read_read_fu_148_p2 == 16'd3) & ~(field_id_read_read_fu_148_p2 == 16'd1) & ~(field_id_read_read_fu_148_p2 == 16'd0) & ~(field_id_read_read_fu_148_p2 == 16'd2) & ~(field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((field_id_read_read_fu_148_p2 == 16'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        fid = 1'd0;
    end else if (((field_id_read_read_fu_148_p2 == 16'd2) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        fid = 1'd1;
    end else if (((field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        fid = fid_in;
    end else begin
        fid = fid_preg;
    end
end

always @ (*) begin
    if (((~(field_id_read_read_fu_148_p2 == 16'd3) & ~(field_id_read_read_fu_148_p2 == 16'd1) & ~(field_id_read_read_fu_148_p2 == 16'd0) & ~(field_id_read_read_fu_148_p2 == 16'd2) & ~(field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((field_id_read_read_fu_148_p2 == 16'd3) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((field_id_read_read_fu_148_p2 == 16'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((field_id_read_read_fu_148_p2 == 16'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((field_id_read_read_fu_148_p2 == 16'd2) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((field_id_read_read_fu_148_p2 == 16'd4) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln962_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        fid_ap_vld = 1'b1;
    end else begin
        fid_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        m_axis_video_TDATA_blk_n = m_axis_video_TREADY_int_regslice;
    end else begin
        m_axis_video_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axis_video_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_video_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ovrlayYUV_blk_n = ovrlayYUV_empty_n;
    end else begin
        ovrlayYUV_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ovrlayYUV_read = 1'b1;
    end else begin
        ovrlayYUV_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd1) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((cmp18187_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((cmp18187_fu_256_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln957_fu_291_p2 == 1'd0) & (regslice_both_AXI_video_strm_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln962_fu_306_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln962_fu_306_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln990_fu_319_p2 = (counter_loc_0_fu_126 + 16'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & (m_axis_video_TREADY_int_regslice == 1'b0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((m_axis_video_TREADY_int_regslice == 1'b0) | (ovrlayYUV_empty_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & (m_axis_video_TREADY_int_regslice == 1'b0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((m_axis_video_TREADY_int_regslice == 1'b0) | (ovrlayYUV_empty_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & (m_axis_video_TREADY_int_regslice == 1'b0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((m_axis_video_TREADY_int_regslice == 1'b0) | (ovrlayYUV_empty_n == 1'b0))));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = ((m_axis_video_TREADY_int_regslice == 1'b0) | (ovrlayYUV_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter2 = (m_axis_video_TREADY_int_regslice == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign axi_last_V_fu_311_p2 = ((zext_ln962_fu_302_p1 == sub_cast_fu_252_p1) ? 1'b1 : 1'b0);

assign cmp18187_fu_256_p2 = ((empty_fu_242_p1 == 13'd0) ? 1'b1 : 1'b0);

assign empty_fu_242_p1 = width[12:0];

assign fid_toggle_1_fu_426_p2 = (fid_toggle_fu_339_p1 ^ 1'd1);

assign fid_toggle_fu_339_p1 = counter_loc_0_fu_126[0:0];

assign field_id_read_read_fu_148_p2 = field_id;

assign i_1_fu_282_p2 = (i_reg_204 + 12'd1);

assign icmp_ln1005_fu_266_p2 = ((colorFormat == 8'd0) ? 1'b1 : 1'b0);

assign icmp_ln957_fu_291_p2 = ((i_reg_204 == trunc_ln912_fu_238_p1) ? 1'b1 : 1'b0);

assign icmp_ln962_fu_306_p2 = ((j_reg_215 == empty_fu_242_p1) ? 1'b1 : 1'b0);

assign j_1_fu_296_p2 = (j_reg_215 + 13'd1);

assign m_axis_video_TDATA_int_regslice = {{tmp_fu_405_p3}, {select_ln1005_fu_384_p3[7:0]}};

assign m_axis_video_TVALID = regslice_both_AXI_video_strm_V_data_V_U_vld_out;

assign p_Result_4_fu_368_p3 = {{16'd65535}, {trunc_ln145_fu_344_p1}};

assign p_Result_s_fu_376_p3 = {{16'd65535}, {trunc_ln145_1_fu_348_p4}};

assign select_ln1005_1_fu_391_p3 = ((icmp_ln1005_fu_266_p2[0:0] == 1'b1) ? trunc_ln145_2_fu_358_p4 : trunc_ln145_1_fu_348_p4);

assign select_ln1005_2_fu_398_p3 = ((icmp_ln1005_fu_266_p2[0:0] == 1'b1) ? trunc_ln145_fu_344_p1 : trunc_ln145_2_fu_358_p4);

assign select_ln1005_fu_384_p3 = ((icmp_ln1005_fu_266_p2[0:0] == 1'b1) ? p_Result_s_fu_376_p3 : p_Result_4_fu_368_p3);

assign sub_cast_fu_252_p1 = $signed(sub_fu_246_p2);

assign sub_fu_246_p2 = ($signed(empty_fu_242_p1) + $signed(13'd8191));

assign tmp_fu_405_p3 = {{select_ln1005_2_fu_398_p3}, {select_ln1005_1_fu_391_p3}};

assign trunc_ln145_1_fu_348_p4 = {{ovrlayYUV_dout[15:8]}};

assign trunc_ln145_2_fu_358_p4 = {{ovrlayYUV_dout[23:16]}};

assign trunc_ln145_fu_344_p1 = ovrlayYUV_dout[7:0];

assign trunc_ln912_fu_238_p1 = height[11:0];

assign zext_ln962_fu_302_p1 = j_reg_215;

endmodule //design_1_v_tpg_0_0_MultiPixStream2AXIvideo
