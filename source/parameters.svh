// `ifdef p720
//     parameter horz_length = 1649;
//     parameter vert_length = 749;
//     parameter h_act = 1279;
//     parameter v_act = 719;
//     parameter h_sync = 40;
//     parameter v_sync = 5;
//     parameter HFP = 110;
//     parameter HBP = 220;
//     parameter VFP = 5;
//     parameter VBP = 20;
// `endif
// `ifdef p1080
//     parameter horz_length = 2199;
//     parameter vert_length = 1124;
//     parameter h_act = 1919;
//     parameter v_act = 1079;
//     parameter h_sync = 44;
//     parameter v_sync = 5;
//     parameter HFP = 88;
//     parameter HBP = 148;
//     parameter VFP = 4;
//     parameter VBP = 36;


//`endif

`ifdef p480         //Pixel Clock runs at 25.175 MHz
    parameter horz_length = 799;
    parameter vert_length = 524;
    parameter h_act = 639;
    parameter v_act = 479;
    parameter h_sync = 96;
    parameter v_sync = 2;
    parameter HFP = 16;
    parameter HBP = 48;
    parameter VFP = 10;
    parameter VBP = 33;


`endif

