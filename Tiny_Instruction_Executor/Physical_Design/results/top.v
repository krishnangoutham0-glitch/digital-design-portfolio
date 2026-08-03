module top (clk,
    halt_out,
    reg_write_out,
    reset,
    alu_result_out,
    dest_out,
    pc_out);
 input clk;
 output halt_out;
 output reg_write_out;
 input reset;
 output [7:0] alu_result_out;
 output [3:0] dest_out;
 output [7:0] pc_out;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _095_;
 wire _096_;
 wire clknet_1_1__leaf_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_0_clk;
 wire _100_;
 wire net24;
 wire _102_;
 wire _104_;
 wire _107_;
 wire _108_;
 wire _110_;
 wire _111_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _167_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _184_;
 wire _185_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;
 wire _222_;
 wire _223_;
 wire _224_;
 wire _225_;
 wire _226_;
 wire _227_;
 wire _228_;
 wire _229_;
 wire _230_;
 wire _231_;
 wire _232_;
 wire _233_;
 wire _234_;
 wire _235_;
 wire _236_;
 wire _237_;
 wire _238_;
 wire _239_;
 wire _240_;
 wire _242_;
 wire _243_;
 wire _244_;
 wire _245_;
 wire _246_;
 wire _247_;
 wire _248_;
 wire _249_;
 wire _250_;
 wire _252_;
 wire _253_;
 wire _254_;
 wire _255_;
 wire _256_;
 wire _257_;
 wire _258_;
 wire _259_;
 wire _260_;
 wire _261_;
 wire _262_;
 wire _263_;
 wire _264_;
 wire _265_;
 wire _266_;
 wire _267_;
 wire _268_;
 wire _269_;
 wire _270_;
 wire _271_;
 wire _272_;
 wire _273_;
 wire _274_;
 wire _275_;
 wire _276_;
 wire _277_;
 wire _278_;
 wire _279_;
 wire _280_;
 wire _281_;
 wire _282_;
 wire _283_;
 wire _284_;
 wire _285_;
 wire _286_;
 wire _287_;
 wire _288_;
 wire _289_;
 wire _290_;
 wire _291_;
 wire _292_;
 wire _293_;
 wire _294_;
 wire _295_;
 wire _296_;
 wire _297_;
 wire _298_;
 wire _299_;
 wire _300_;
 wire _301_;
 wire _302_;
 wire _303_;
 wire _304_;
 wire _305_;
 wire _306_;
 wire _307_;
 wire _308_;
 wire _309_;
 wire _310_;
 wire _311_;
 wire _312_;
 wire _313_;
 wire _314_;
 wire _315_;
 wire _316_;
 wire _317_;
 wire _318_;
 wire _319_;
 wire _320_;
 wire _321_;
 wire _322_;
 wire _323_;
 wire _324_;
 wire _325_;
 wire _326_;
 wire _327_;
 wire _328_;
 wire _329_;
 wire _330_;
 wire \alu_b_w[0] ;
 wire \alu_b_w[1] ;
 wire \alu_b_w[2] ;
 wire \alu_b_w[3] ;
 wire \alu_b_w[4] ;
 wire \alu_b_w[5] ;
 wire \alu_b_w[6] ;
 wire \alu_b_w[7] ;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire \read_data1_w[0] ;
 wire \read_data1_w[1] ;
 wire \read_data1_w[2] ;
 wire \read_data1_w[3] ;
 wire \read_data1_w[4] ;
 wire \read_data1_w[5] ;
 wire \read_data1_w[6] ;
 wire \read_data1_w[7] ;
 wire net23;
 wire net1;
 wire \u_register_file.reg_file[1][0] ;
 wire \u_register_file.reg_file[1][1] ;
 wire \u_register_file.reg_file[1][2] ;
 wire \u_register_file.reg_file[1][3] ;
 wire \u_register_file.reg_file[1][4] ;
 wire \u_register_file.reg_file[1][5] ;
 wire \u_register_file.reg_file[1][6] ;
 wire \u_register_file.reg_file[1][7] ;
 wire \u_register_file.reg_file[5][3] ;
 wire \u_register_file.reg_file[5][4] ;
 wire \u_register_file.reg_file[7][3] ;
 wire \u_register_file.reg_file[7][4] ;
 wire net25;
 wire net26;

 INV_X1 _334_ (.A(net16),
    .ZN(_100_));
 NAND2_X1 _336_ (.A1(net15),
    .A2(_100_),
    .ZN(_102_));
 INV_X2 _338_ (.A(_000_),
    .ZN(_104_));
 NAND2_X1 _341_ (.A1(_104_),
    .A2(net18),
    .ZN(_107_));
 NOR2_X1 _342_ (.A1(_102_),
    .A2(_107_),
    .ZN(_108_));
 INV_X4 _344_ (.A(net18),
    .ZN(_110_));
 NAND2_X2 _345_ (.A1(net17),
    .A2(_110_),
    .ZN(_111_));
 NAND2_X1 _347_ (.A1(net15),
    .A2(net16),
    .ZN(_113_));
 NOR2_X1 _348_ (.A1(_111_),
    .A2(_113_),
    .ZN(_114_));
 INV_X1 _349_ (.A(_111_),
    .ZN(net12));
 NOR2_X1 _350_ (.A1(net15),
    .A2(_100_),
    .ZN(_115_));
 AND2_X1 _351_ (.A1(net12),
    .A2(_115_),
    .ZN(_116_));
 AOI222_X1 _352_ (.A1(\read_data1_w[4] ),
    .A2(_108_),
    .B1(_114_),
    .B2(_023_),
    .C1(_116_),
    .C2(_026_),
    .ZN(_117_));
 OR2_X1 _354_ (.A1(net15),
    .A2(net16),
    .ZN(_119_));
 NOR2_X2 _355_ (.A1(_111_),
    .A2(_119_),
    .ZN(_120_));
 NAND2_X1 _356_ (.A1(_000_),
    .A2(_120_),
    .ZN(_121_));
 INV_X1 _357_ (.A(_027_),
    .ZN(_122_));
 NOR2_X1 _358_ (.A1(_111_),
    .A2(_102_),
    .ZN(_123_));
 NAND2_X1 _359_ (.A1(_104_),
    .A2(_123_),
    .ZN(_124_));
 OAI221_X1 _360_ (.A(_117_),
    .B1(_121_),
    .B2(_122_),
    .C1(_025_),
    .C2(_124_),
    .ZN(_125_));
 MUX2_X1 _361_ (.A(_110_),
    .B(_111_),
    .S(net15),
    .Z(_126_));
 NOR3_X2 _362_ (.A1(_104_),
    .A2(net16),
    .A3(_126_),
    .ZN(_127_));
 AOI21_X1 _364_ (.A(_125_),
    .B1(_127_),
    .B2(\read_data1_w[2] ),
    .ZN(_129_));
 INV_X1 _365_ (.A(_047_),
    .ZN(_130_));
 INV_X1 _366_ (.A(_004_),
    .ZN(_131_));
 AOI21_X1 _367_ (.A(_049_),
    .B1(_045_),
    .B2(_131_),
    .ZN(_132_));
 INV_X1 _368_ (.A(_048_),
    .ZN(_133_));
 OAI21_X1 _369_ (.A(_130_),
    .B1(_132_),
    .B2(_133_),
    .ZN(_134_));
 XNOR2_X1 _370_ (.A(_062_),
    .B(_134_),
    .ZN(_135_));
 NOR2_X1 _371_ (.A1(net15),
    .A2(_000_),
    .ZN(_136_));
 INV_X1 _372_ (.A(net17),
    .ZN(_137_));
 OAI21_X1 _373_ (.A(_110_),
    .B1(_137_),
    .B2(net16),
    .ZN(_138_));
 AND2_X1 _374_ (.A1(net15),
    .A2(_000_),
    .ZN(_139_));
 AOI222_X4 _375_ (.A1(net16),
    .A2(_111_),
    .B1(_136_),
    .B2(_138_),
    .C1(_139_),
    .C2(net18),
    .ZN(_140_));
 OAI21_X1 _376_ (.A(_129_),
    .B1(_135_),
    .B2(_140_),
    .ZN(net5));
 AOI222_X1 _378_ (.A1(\read_data1_w[5] ),
    .A2(_108_),
    .B1(_114_),
    .B2(_018_),
    .C1(_116_),
    .C2(_021_),
    .ZN(_142_));
 INV_X1 _379_ (.A(_022_),
    .ZN(_143_));
 OAI221_X1 _380_ (.A(_142_),
    .B1(_124_),
    .B2(_020_),
    .C1(_143_),
    .C2(_121_),
    .ZN(_144_));
 AOI21_X1 _381_ (.A(_144_),
    .B1(_127_),
    .B2(\read_data1_w[3] ),
    .ZN(_145_));
 INV_X1 _382_ (.A(_055_),
    .ZN(_146_));
 OAI21_X1 _383_ (.A(_130_),
    .B1(_005_),
    .B2(_133_),
    .ZN(_147_));
 AOI21_X1 _384_ (.A(_061_),
    .B1(_062_),
    .B2(_147_),
    .ZN(_148_));
 XNOR2_X1 _385_ (.A(_146_),
    .B(_148_),
    .ZN(_149_));
 OAI21_X1 _386_ (.A(_145_),
    .B1(_149_),
    .B2(_140_),
    .ZN(net6));
 MUX2_X1 _388_ (.A(_016_),
    .B(_013_),
    .S(net15),
    .Z(_151_));
 NAND2_X2 _389_ (.A1(net16),
    .A2(net17),
    .ZN(_152_));
 NOR2_X1 _390_ (.A1(net18),
    .A2(_152_),
    .ZN(_153_));
 AOI22_X1 _391_ (.A1(\read_data1_w[6] ),
    .A2(_108_),
    .B1(_151_),
    .B2(_153_),
    .ZN(_154_));
 OAI21_X1 _392_ (.A(_154_),
    .B1(_124_),
    .B2(_015_),
    .ZN(_155_));
 NOR3_X1 _393_ (.A1(_104_),
    .A2(_111_),
    .A3(_119_),
    .ZN(_156_));
 AOI221_X1 _394_ (.A(_155_),
    .B1(_156_),
    .B2(_017_),
    .C1(\read_data1_w[4] ),
    .C2(_127_),
    .ZN(_157_));
 AND3_X1 _395_ (.A1(_047_),
    .A2(_055_),
    .A3(_062_),
    .ZN(_158_));
 AOI21_X1 _396_ (.A(_158_),
    .B1(_061_),
    .B2(_055_),
    .ZN(_159_));
 NAND3_X1 _397_ (.A1(_048_),
    .A2(_055_),
    .A3(_062_),
    .ZN(_160_));
 OAI21_X1 _398_ (.A(_159_),
    .B1(_160_),
    .B2(_132_),
    .ZN(_161_));
 NOR2_X1 _399_ (.A1(_054_),
    .A2(_161_),
    .ZN(_162_));
 XOR2_X1 _400_ (.A(_052_),
    .B(_162_),
    .Z(_163_));
 OAI21_X1 _401_ (.A(_157_),
    .B1(_163_),
    .B2(_140_),
    .ZN(net7));
 OR2_X1 _402_ (.A1(_010_),
    .A2(_124_),
    .ZN(_164_));
 AOI22_X1 _405_ (.A1(\read_data1_w[7] ),
    .A2(_108_),
    .B1(_114_),
    .B2(_008_),
    .ZN(_167_));
 AOI22_X1 _407_ (.A1(_012_),
    .A2(_156_),
    .B1(_116_),
    .B2(_011_),
    .ZN(_169_));
 NAND2_X1 _408_ (.A1(\read_data1_w[5] ),
    .A2(_127_),
    .ZN(_170_));
 AND4_X1 _409_ (.A1(_164_),
    .A2(_167_),
    .A3(_169_),
    .A4(_170_),
    .ZN(_171_));
 INV_X1 _410_ (.A(_054_),
    .ZN(_172_));
 OAI21_X1 _411_ (.A(_172_),
    .B1(_148_),
    .B2(_146_),
    .ZN(_173_));
 AOI21_X1 _412_ (.A(_051_),
    .B1(_173_),
    .B2(_052_),
    .ZN(_174_));
 XOR2_X1 _413_ (.A(_041_),
    .B(_174_),
    .Z(_175_));
 OAI21_X1 _414_ (.A(_171_),
    .B1(_175_),
    .B2(_140_),
    .ZN(net8));
 NAND2_X1 _415_ (.A1(_056_),
    .A2(_153_),
    .ZN(_176_));
 NAND2_X1 _416_ (.A1(_100_),
    .A2(\read_data1_w[1] ),
    .ZN(_177_));
 OAI21_X1 _417_ (.A(_176_),
    .B1(_177_),
    .B2(_107_),
    .ZN(_178_));
 NAND2_X1 _418_ (.A1(net15),
    .A2(_178_),
    .ZN(_179_));
 OR2_X2 _419_ (.A1(net16),
    .A2(net17),
    .ZN(_180_));
 NOR2_X2 _420_ (.A1(net18),
    .A2(_180_),
    .ZN(_181_));
 NOR2_X1 _421_ (.A1(_000_),
    .A2(_057_),
    .ZN(_182_));
 AOI221_X1 _423_ (.A(_181_),
    .B1(_182_),
    .B2(_123_),
    .C1(_156_),
    .C2(_059_),
    .ZN(_184_));
 NAND2_X1 _424_ (.A1(net18),
    .A2(_139_),
    .ZN(_185_));
 AOI21_X1 _426_ (.A(net18),
    .B1(net17),
    .B2(_100_),
    .ZN(_187_));
 OR2_X4 _427_ (.A1(net15),
    .A2(_000_),
    .ZN(_188_));
 OAI221_X1 _428_ (.A(_185_),
    .B1(_187_),
    .B2(_188_),
    .C1(_100_),
    .C2(net12),
    .ZN(_189_));
 OAI21_X1 _429_ (.A(_058_),
    .B1(_189_),
    .B2(_116_),
    .ZN(_190_));
 NAND3_X1 _430_ (.A1(_179_),
    .A2(_184_),
    .A3(_190_),
    .ZN(net2));
 AOI222_X1 _431_ (.A1(\read_data1_w[2] ),
    .A2(_108_),
    .B1(_114_),
    .B2(_002_),
    .C1(_036_),
    .C2(_156_),
    .ZN(_191_));
 OR2_X1 _432_ (.A1(_006_),
    .A2(_140_),
    .ZN(_192_));
 INV_X1 _434_ (.A(net15),
    .ZN(_194_));
 NOR2_X1 _435_ (.A1(_194_),
    .A2(net16),
    .ZN(_195_));
 OAI21_X1 _436_ (.A(net17),
    .B1(_034_),
    .B2(_000_),
    .ZN(_196_));
 NAND2_X1 _437_ (.A1(_195_),
    .A2(_196_),
    .ZN(_197_));
 NAND3_X1 _438_ (.A1(net17),
    .A2(_035_),
    .A3(_115_),
    .ZN(_198_));
 AOI21_X1 _439_ (.A(net18),
    .B1(_197_),
    .B2(_198_),
    .ZN(_199_));
 AOI21_X1 _440_ (.A(_199_),
    .B1(_127_),
    .B2(\read_data1_w[0] ),
    .ZN(_200_));
 NAND3_X1 _441_ (.A1(_191_),
    .A2(_192_),
    .A3(_200_),
    .ZN(net3));
 XNOR2_X1 _442_ (.A(_048_),
    .B(_005_),
    .ZN(_201_));
 AOI22_X1 _443_ (.A1(\read_data1_w[1] ),
    .A2(_127_),
    .B1(_189_),
    .B2(_201_),
    .ZN(_202_));
 AOI22_X1 _444_ (.A1(\read_data1_w[3] ),
    .A2(_108_),
    .B1(_116_),
    .B2(_031_),
    .ZN(_203_));
 OAI21_X1 _445_ (.A(_203_),
    .B1(_124_),
    .B2(_030_),
    .ZN(_204_));
 NAND2_X1 _446_ (.A1(net15),
    .A2(_028_),
    .ZN(_205_));
 OAI22_X1 _447_ (.A1(_104_),
    .A2(_180_),
    .B1(_205_),
    .B2(_152_),
    .ZN(_206_));
 AOI221_X1 _448_ (.A(_204_),
    .B1(_206_),
    .B2(_110_),
    .C1(_032_),
    .C2(_156_),
    .ZN(_207_));
 NAND2_X1 _449_ (.A1(_202_),
    .A2(_207_),
    .ZN(net4));
 MUX2_X1 _450_ (.A(\u_register_file.reg_file[5][3] ),
    .B(net5),
    .S(_123_),
    .Z(_079_));
 MUX2_X1 _451_ (.A(\u_register_file.reg_file[5][4] ),
    .B(net6),
    .S(_123_),
    .Z(_078_));
 MUX2_X1 _452_ (.A(\u_register_file.reg_file[7][3] ),
    .B(_023_),
    .S(_114_),
    .Z(_077_));
 MUX2_X1 _453_ (.A(\u_register_file.reg_file[7][4] ),
    .B(_018_),
    .S(_114_),
    .Z(_076_));
 OAI21_X1 _454_ (.A(net18),
    .B1(_139_),
    .B2(net16),
    .ZN(net23));
 NAND2_X1 _455_ (.A1(net16),
    .A2(net18),
    .ZN(_208_));
 MUX2_X1 _456_ (.A(net15),
    .B(_000_),
    .S(_208_),
    .Z(_075_));
 NAND2_X1 _457_ (.A1(_038_),
    .A2(net23),
    .ZN(_209_));
 NAND2_X1 _458_ (.A1(_208_),
    .A2(_209_),
    .ZN(_074_));
 NAND2_X1 _459_ (.A1(_037_),
    .A2(net23),
    .ZN(_210_));
 XNOR2_X1 _460_ (.A(net17),
    .B(_210_),
    .ZN(_073_));
 OAI21_X1 _461_ (.A(_110_),
    .B1(_113_),
    .B2(_137_),
    .ZN(_072_));
 NAND4_X1 _462_ (.A1(net17),
    .A2(net18),
    .A3(_037_),
    .A4(net23),
    .ZN(_211_));
 XNOR2_X1 _463_ (.A(net19),
    .B(_211_),
    .ZN(_071_));
 NAND2_X1 _465_ (.A1(net19),
    .A2(net20),
    .ZN(_212_));
 OR2_X1 _466_ (.A1(_211_),
    .A2(_212_),
    .ZN(_213_));
 XNOR2_X1 _467_ (.A(net21),
    .B(_213_),
    .ZN(_069_));
 INV_X1 _468_ (.A(\u_register_file.reg_file[1][1] ),
    .ZN(_214_));
 NOR2_X2 _469_ (.A1(net16),
    .A2(net17),
    .ZN(_215_));
 AOI221_X1 _470_ (.A(net18),
    .B1(_214_),
    .B2(net17),
    .C1(_215_),
    .C2(_194_),
    .ZN(_216_));
 AOI21_X1 _471_ (.A(_214_),
    .B1(net17),
    .B2(_104_),
    .ZN(_217_));
 OAI21_X1 _472_ (.A(_216_),
    .B1(_217_),
    .B2(_100_),
    .ZN(_218_));
 OAI21_X2 _473_ (.A(_110_),
    .B1(_152_),
    .B2(_000_),
    .ZN(_219_));
 NAND2_X1 _474_ (.A1(\read_data1_w[1] ),
    .A2(_219_),
    .ZN(_220_));
 NAND2_X1 _475_ (.A1(_218_),
    .A2(_220_),
    .ZN(\alu_b_w[1] ));
 AND2_X1 _476_ (.A1(net16),
    .A2(net17),
    .ZN(_221_));
 AOI221_X4 _477_ (.A(net18),
    .B1(_188_),
    .B2(_215_),
    .C1(_221_),
    .C2(_104_),
    .ZN(_222_));
 AOI221_X2 _478_ (.A(_181_),
    .B1(_219_),
    .B2(\read_data1_w[0] ),
    .C1(_222_),
    .C2(\u_register_file.reg_file[1][0] ),
    .ZN(_042_));
 INV_X1 _479_ (.A(_042_),
    .ZN(\alu_b_w[0] ));
 NOR2_X1 _480_ (.A1(net17),
    .A2(net18),
    .ZN(_223_));
 MUX2_X1 _481_ (.A(\u_register_file.reg_file[5][3] ),
    .B(\u_register_file.reg_file[7][3] ),
    .S(net15),
    .Z(_224_));
 AND4_X1 _482_ (.A1(_000_),
    .A2(_100_),
    .A3(_223_),
    .A4(_224_),
    .ZN(_225_));
 AOI221_X2 _483_ (.A(_225_),
    .B1(_222_),
    .B2(\u_register_file.reg_file[1][3] ),
    .C1(\read_data1_w[3] ),
    .C2(_219_),
    .ZN(_226_));
 OR2_X1 _484_ (.A1(_181_),
    .A2(_226_),
    .ZN(_024_));
 INV_X1 _485_ (.A(_024_),
    .ZN(\alu_b_w[3] ));
 MUX2_X1 _486_ (.A(\u_register_file.reg_file[5][4] ),
    .B(\u_register_file.reg_file[7][4] ),
    .S(net15),
    .Z(_227_));
 AND4_X1 _487_ (.A1(_000_),
    .A2(_100_),
    .A3(_223_),
    .A4(_227_),
    .ZN(_228_));
 AOI221_X2 _488_ (.A(_228_),
    .B1(_222_),
    .B2(\u_register_file.reg_file[1][4] ),
    .C1(\read_data1_w[4] ),
    .C2(_219_),
    .ZN(_229_));
 OR2_X1 _489_ (.A1(_181_),
    .A2(_229_),
    .ZN(_019_));
 INV_X1 _490_ (.A(_019_),
    .ZN(\alu_b_w[4] ));
 AND3_X1 _491_ (.A1(_104_),
    .A2(net16),
    .A3(\read_data1_w[5] ),
    .ZN(_230_));
 NOR2_X1 _492_ (.A1(net16),
    .A2(net18),
    .ZN(_231_));
 AND2_X1 _493_ (.A1(\u_register_file.reg_file[1][5] ),
    .A2(_231_),
    .ZN(_232_));
 OAI21_X1 _494_ (.A(net17),
    .B1(_230_),
    .B2(_232_),
    .ZN(_233_));
 AOI211_X2 _495_ (.A(_100_),
    .B(net18),
    .C1(net17),
    .C2(_104_),
    .ZN(_234_));
 AOI22_X1 _496_ (.A1(net18),
    .A2(\read_data1_w[5] ),
    .B1(\u_register_file.reg_file[1][5] ),
    .B2(_234_),
    .ZN(_235_));
 AND2_X1 _497_ (.A1(_233_),
    .A2(_235_),
    .ZN(_014_));
 INV_X1 _498_ (.A(_014_),
    .ZN(\alu_b_w[5] ));
 AOI22_X1 _499_ (.A1(net18),
    .A2(\read_data1_w[6] ),
    .B1(\u_register_file.reg_file[1][6] ),
    .B2(_234_),
    .ZN(_236_));
 NOR2_X1 _500_ (.A1(_000_),
    .A2(_100_),
    .ZN(_237_));
 AOI22_X1 _501_ (.A1(\read_data1_w[6] ),
    .A2(_237_),
    .B1(_231_),
    .B2(\u_register_file.reg_file[1][6] ),
    .ZN(_238_));
 OAI21_X1 _502_ (.A(_236_),
    .B1(_238_),
    .B2(_137_),
    .ZN(\alu_b_w[6] ));
 INV_X1 _503_ (.A(\alu_b_w[6] ),
    .ZN(_009_));
 MUX2_X1 _504_ (.A(_119_),
    .B(_100_),
    .S(_223_),
    .Z(_239_));
 NOR2_X1 _505_ (.A1(_000_),
    .A2(_239_),
    .ZN(_240_));
 MUX2_X1 _507_ (.A(_044_),
    .B(\alu_b_w[1] ),
    .S(_240_),
    .Z(_003_));
 INV_X1 _508_ (.A(_003_),
    .ZN(_007_));
 XOR2_X1 _509_ (.A(net16),
    .B(net17),
    .Z(_242_));
 OR2_X1 _510_ (.A1(\u_register_file.reg_file[1][2] ),
    .A2(_215_),
    .ZN(_243_));
 AOI22_X1 _511_ (.A1(\u_register_file.reg_file[1][2] ),
    .A2(_242_),
    .B1(_243_),
    .B2(_000_),
    .ZN(_244_));
 NOR2_X1 _512_ (.A1(net18),
    .A2(_244_),
    .ZN(_245_));
 AND2_X1 _513_ (.A1(\read_data1_w[2] ),
    .A2(_219_),
    .ZN(_246_));
 NOR2_X1 _514_ (.A1(_245_),
    .A2(_246_),
    .ZN(_029_));
 INV_X1 _515_ (.A(_029_),
    .ZN(\alu_b_w[2] ));
 NAND2_X1 _516_ (.A1(net18),
    .A2(_001_),
    .ZN(_247_));
 INV_X1 _517_ (.A(_247_),
    .ZN(net13));
 NOR2_X1 _518_ (.A1(_100_),
    .A2(net18),
    .ZN(net11));
 INV_X1 _519_ (.A(_208_),
    .ZN(net14));
 NOR2_X1 _520_ (.A1(_194_),
    .A2(net14),
    .ZN(net10));
 NOR2_X1 _521_ (.A1(_043_),
    .A2(_240_),
    .ZN(_248_));
 XNOR2_X1 _522_ (.A(\alu_b_w[2] ),
    .B(_248_),
    .ZN(_046_));
 NOR2_X1 _523_ (.A1(\alu_b_w[3] ),
    .A2(\alu_b_w[2] ),
    .ZN(_249_));
 AOI21_X1 _524_ (.A(_240_),
    .B1(_249_),
    .B2(_043_),
    .ZN(_250_));
 XNOR2_X1 _525_ (.A(\alu_b_w[4] ),
    .B(_250_),
    .ZN(_053_));
 INV_X1 _526_ (.A(\alu_b_w[1] ),
    .ZN(_033_));
 AOI22_X1 _528_ (.A1(\read_data1_w[7] ),
    .A2(_237_),
    .B1(_231_),
    .B2(\u_register_file.reg_file[1][7] ),
    .ZN(_252_));
 NOR2_X1 _529_ (.A1(_137_),
    .A2(_252_),
    .ZN(_253_));
 AOI221_X1 _530_ (.A(_253_),
    .B1(_234_),
    .B2(\u_register_file.reg_file[1][7] ),
    .C1(net18),
    .C2(\read_data1_w[7] ),
    .ZN(_064_));
 INV_X1 _531_ (.A(_064_),
    .ZN(\alu_b_w[7] ));
 NAND2_X1 _532_ (.A1(\read_data1_w[2] ),
    .A2(_219_),
    .ZN(_254_));
 OAI221_X2 _533_ (.A(_254_),
    .B1(_226_),
    .B2(_181_),
    .C1(net18),
    .C2(_244_),
    .ZN(_255_));
 OAI211_X2 _534_ (.A(_233_),
    .B(_235_),
    .C1(_181_),
    .C2(_229_),
    .ZN(_256_));
 NOR2_X2 _535_ (.A1(_255_),
    .A2(_256_),
    .ZN(_257_));
 AOI21_X1 _536_ (.A(_240_),
    .B1(_257_),
    .B2(_043_),
    .ZN(_258_));
 XNOR2_X1 _537_ (.A(\alu_b_w[6] ),
    .B(_258_),
    .ZN(_039_));
 INV_X1 _538_ (.A(net1),
    .ZN(_068_));
 MUX2_X1 _539_ (.A(_066_),
    .B(_063_),
    .S(net15),
    .Z(_259_));
 AOI22_X1 _540_ (.A1(_067_),
    .A2(_156_),
    .B1(_153_),
    .B2(_259_),
    .ZN(_260_));
 OAI21_X1 _541_ (.A(_260_),
    .B1(_124_),
    .B2(_065_),
    .ZN(_261_));
 AOI21_X1 _542_ (.A(_261_),
    .B1(_127_),
    .B2(\read_data1_w[6] ),
    .ZN(_262_));
 NAND3_X2 _543_ (.A1(_218_),
    .A2(_220_),
    .A3(_042_),
    .ZN(_263_));
 INV_X1 _544_ (.A(_263_),
    .ZN(_264_));
 NOR3_X1 _545_ (.A1(_054_),
    .A2(_051_),
    .A3(_040_),
    .ZN(_265_));
 OAI211_X2 _546_ (.A(_159_),
    .B(_265_),
    .C1(_132_),
    .C2(_160_),
    .ZN(_266_));
 NOR2_X1 _547_ (.A1(_041_),
    .A2(_040_),
    .ZN(_267_));
 NOR3_X1 _548_ (.A1(_052_),
    .A2(_051_),
    .A3(_040_),
    .ZN(_268_));
 NOR2_X1 _549_ (.A1(_267_),
    .A2(_268_),
    .ZN(_269_));
 AND2_X2 _550_ (.A1(_266_),
    .A2(_269_),
    .ZN(_270_));
 NAND3_X1 _551_ (.A1(net17),
    .A2(\u_register_file.reg_file[1][7] ),
    .A3(\read_data1_w[7] ),
    .ZN(_271_));
 NAND2_X1 _552_ (.A1(_110_),
    .A2(_271_),
    .ZN(_272_));
 NAND2_X1 _553_ (.A1(\u_register_file.reg_file[1][7] ),
    .A2(_180_),
    .ZN(_273_));
 INV_X1 _554_ (.A(\read_data1_w[7] ),
    .ZN(_274_));
 NAND2_X1 _555_ (.A1(\u_register_file.reg_file[1][7] ),
    .A2(\read_data1_w[7] ),
    .ZN(_275_));
 OAI21_X1 _556_ (.A(_275_),
    .B1(_137_),
    .B2(_000_),
    .ZN(_276_));
 AOI221_X1 _557_ (.A(_272_),
    .B1(_273_),
    .B2(_274_),
    .C1(_276_),
    .C2(net16),
    .ZN(_277_));
 NOR3_X1 _558_ (.A1(_140_),
    .A2(_240_),
    .A3(_277_),
    .ZN(_278_));
 NAND2_X1 _559_ (.A1(_270_),
    .A2(_278_),
    .ZN(_279_));
 NAND2_X2 _560_ (.A1(_266_),
    .A2(_269_),
    .ZN(_280_));
 NOR2_X1 _561_ (.A1(_140_),
    .A2(_240_),
    .ZN(_281_));
 NAND3_X1 _562_ (.A1(_280_),
    .A2(_277_),
    .A3(_281_),
    .ZN(_282_));
 AOI22_X1 _563_ (.A1(_009_),
    .A2(_264_),
    .B1(_279_),
    .B2(_282_),
    .ZN(_283_));
 OR2_X4 _564_ (.A1(_255_),
    .A2(_256_),
    .ZN(_284_));
 AOI22_X1 _565_ (.A1(net16),
    .A2(_276_),
    .B1(_273_),
    .B2(_274_),
    .ZN(_285_));
 NAND3_X1 _566_ (.A1(_110_),
    .A2(_271_),
    .A3(_285_),
    .ZN(_286_));
 NAND3_X1 _567_ (.A1(_189_),
    .A2(_280_),
    .A3(_286_),
    .ZN(_287_));
 NOR4_X2 _568_ (.A1(\alu_b_w[6] ),
    .A2(_284_),
    .A3(_263_),
    .A4(_287_),
    .ZN(_288_));
 OAI211_X2 _569_ (.A(_270_),
    .B(_278_),
    .C1(_255_),
    .C2(_256_),
    .ZN(_289_));
 NAND2_X1 _570_ (.A1(_189_),
    .A2(_277_),
    .ZN(_290_));
 OR4_X2 _571_ (.A1(\alu_b_w[6] ),
    .A2(_280_),
    .A3(_263_),
    .A4(_290_),
    .ZN(_291_));
 OAI21_X4 _572_ (.A(_289_),
    .B1(_291_),
    .B2(_284_),
    .ZN(_292_));
 NAND3_X1 _573_ (.A1(_240_),
    .A2(_280_),
    .A3(_286_),
    .ZN(_293_));
 NAND2_X1 _574_ (.A1(_240_),
    .A2(_277_),
    .ZN(_294_));
 OAI221_X2 _575_ (.A(_293_),
    .B1(_294_),
    .B2(_280_),
    .C1(_282_),
    .C2(_257_),
    .ZN(_295_));
 NOR4_X4 _576_ (.A1(_283_),
    .A2(_288_),
    .A3(_292_),
    .A4(_295_),
    .ZN(_296_));
 NAND2_X2 _577_ (.A1(_262_),
    .A2(_296_),
    .ZN(net9));
 NAND4_X1 _578_ (.A1(_111_),
    .A2(_195_),
    .A3(net23),
    .A4(_247_),
    .ZN(_297_));
 AND2_X1 _579_ (.A1(\u_register_file.reg_file[1][7] ),
    .A2(_297_),
    .ZN(_096_));
 NOR3_X2 _580_ (.A1(net12),
    .A2(_119_),
    .A3(net13),
    .ZN(_298_));
 NOR2_X1 _581_ (.A1(\read_data1_w[7] ),
    .A2(_298_),
    .ZN(_299_));
 AND2_X1 _582_ (.A1(_262_),
    .A2(_298_),
    .ZN(_300_));
 AOI21_X2 _583_ (.A(_299_),
    .B1(_300_),
    .B2(_296_),
    .ZN(_095_));
 MUX2_X1 _585_ (.A(\read_data1_w[0] ),
    .B(net2),
    .S(_298_),
    .Z(_093_));
 MUX2_X1 _586_ (.A(\read_data1_w[1] ),
    .B(net3),
    .S(_298_),
    .Z(_092_));
 MUX2_X1 _587_ (.A(\read_data1_w[2] ),
    .B(net4),
    .S(_298_),
    .Z(_091_));
 MUX2_X1 _588_ (.A(\read_data1_w[3] ),
    .B(net5),
    .S(_298_),
    .Z(_090_));
 MUX2_X1 _589_ (.A(\read_data1_w[4] ),
    .B(net6),
    .S(_298_),
    .Z(_089_));
 MUX2_X1 _590_ (.A(\read_data1_w[5] ),
    .B(net7),
    .S(_298_),
    .Z(_088_));
 MUX2_X1 _591_ (.A(\read_data1_w[6] ),
    .B(net8),
    .S(_298_),
    .Z(_087_));
 MUX2_X1 _592_ (.A(net2),
    .B(\u_register_file.reg_file[1][0] ),
    .S(_297_),
    .Z(_086_));
 MUX2_X1 _593_ (.A(net3),
    .B(\u_register_file.reg_file[1][1] ),
    .S(_297_),
    .Z(_085_));
 MUX2_X1 _594_ (.A(net4),
    .B(\u_register_file.reg_file[1][2] ),
    .S(_297_),
    .Z(_084_));
 MUX2_X1 _595_ (.A(net5),
    .B(\u_register_file.reg_file[1][3] ),
    .S(_297_),
    .Z(_083_));
 MUX2_X1 _596_ (.A(net6),
    .B(\u_register_file.reg_file[1][4] ),
    .S(_297_),
    .Z(_082_));
 MUX2_X1 _597_ (.A(net7),
    .B(\u_register_file.reg_file[1][5] ),
    .S(_297_),
    .Z(_081_));
 MUX2_X1 _598_ (.A(net8),
    .B(\u_register_file.reg_file[1][6] ),
    .S(_297_),
    .Z(_080_));
 NOR3_X1 _599_ (.A1(\alu_b_w[4] ),
    .A2(_255_),
    .A3(_263_),
    .ZN(_301_));
 NOR2_X1 _600_ (.A1(_240_),
    .A2(_301_),
    .ZN(_302_));
 XNOR2_X1 _601_ (.A(\alu_b_w[5] ),
    .B(_302_),
    .ZN(_050_));
 AOI21_X1 _602_ (.A(_240_),
    .B1(_029_),
    .B2(_264_),
    .ZN(_303_));
 XNOR2_X1 _603_ (.A(\alu_b_w[3] ),
    .B(_303_),
    .ZN(_060_));
 FA_X1 _604_ (.A(_002_),
    .B(_003_),
    .CI(_004_),
    .CO(_005_),
    .S(_006_));
 HA_X1 _605_ (.A(_008_),
    .B(_009_),
    .CO(_010_),
    .S(_011_));
 HA_X1 _606_ (.A(\read_data1_w[6] ),
    .B(\alu_b_w[6] ),
    .CO(_012_),
    .S(_322_));
 HA_X1 _607_ (.A(_013_),
    .B(_014_),
    .CO(_015_),
    .S(_016_));
 HA_X1 _608_ (.A(\read_data1_w[5] ),
    .B(\alu_b_w[5] ),
    .CO(_017_),
    .S(_323_));
 HA_X1 _609_ (.A(_018_),
    .B(_019_),
    .CO(_020_),
    .S(_021_));
 HA_X1 _610_ (.A(\read_data1_w[4] ),
    .B(\alu_b_w[4] ),
    .CO(_022_),
    .S(_324_));
 HA_X1 _611_ (.A(_023_),
    .B(_024_),
    .CO(_025_),
    .S(_026_));
 HA_X1 _612_ (.A(\read_data1_w[3] ),
    .B(\alu_b_w[3] ),
    .CO(_027_),
    .S(_325_));
 HA_X1 _613_ (.A(_028_),
    .B(_029_),
    .CO(_030_),
    .S(_031_));
 HA_X1 _614_ (.A(\read_data1_w[2] ),
    .B(\alu_b_w[2] ),
    .CO(_032_),
    .S(_326_));
 HA_X1 _615_ (.A(_002_),
    .B(_033_),
    .CO(_034_),
    .S(_035_));
 HA_X1 _616_ (.A(\read_data1_w[1] ),
    .B(\alu_b_w[1] ),
    .CO(_036_),
    .S(_327_));
 HA_X1 _617_ (.A(net15),
    .B(net16),
    .CO(_037_),
    .S(_038_));
 HA_X1 _618_ (.A(\read_data1_w[6] ),
    .B(_039_),
    .CO(_040_),
    .S(_041_));
 HA_X1 _619_ (.A(_042_),
    .B(_033_),
    .CO(_043_),
    .S(_044_));
 HA_X1 _620_ (.A(\read_data1_w[2] ),
    .B(_046_),
    .CO(_047_),
    .S(_048_));
 HA_X1 _621_ (.A(\read_data1_w[1] ),
    .B(_007_),
    .CO(_049_),
    .S(_045_));
 HA_X1 _622_ (.A(\read_data1_w[5] ),
    .B(_050_),
    .CO(_051_),
    .S(_052_));
 HA_X1 _623_ (.A(\read_data1_w[4] ),
    .B(_053_),
    .CO(_054_),
    .S(_055_));
 HA_X1 _624_ (.A(_056_),
    .B(_042_),
    .CO(_057_),
    .S(_058_));
 HA_X1 _625_ (.A(_056_),
    .B(\alu_b_w[0] ),
    .CO(_004_),
    .S(_328_));
 HA_X1 _626_ (.A(\read_data1_w[0] ),
    .B(\alu_b_w[0] ),
    .CO(_059_),
    .S(_329_));
 HA_X1 _627_ (.A(\read_data1_w[3] ),
    .B(_060_),
    .CO(_061_),
    .S(_062_));
 HA_X1 _628_ (.A(_063_),
    .B(_064_),
    .CO(_065_),
    .S(_066_));
 HA_X1 _629_ (.A(\read_data1_w[7] ),
    .B(\alu_b_w[7] ),
    .CO(_067_),
    .S(_330_));
 CLKBUF_X3 clkbuf_0_clk (.A(clk),
    .Z(clknet_0_clk));
 CLKBUF_X3 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_0__leaf_clk));
 CLKBUF_X3 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_1__leaf_clk));
 INV_X2 clkload0 (.A(clknet_1_0__leaf_clk));
 CLKBUF_X1 hold25 (.A(net22),
    .Z(net25));
 CLKBUF_X1 hold26 (.A(net20),
    .Z(net26));
 BUF_X1 input1 (.A(reset),
    .Z(net1));
 BUF_X4 max_cap24 (.A(_068_),
    .Z(net24));
 BUF_X1 output10 (.A(net10),
    .Z(dest_out[0]));
 BUF_X1 output11 (.A(net11),
    .Z(dest_out[1]));
 BUF_X1 output12 (.A(net12),
    .Z(dest_out[2]));
 BUF_X1 output13 (.A(net13),
    .Z(dest_out[3]));
 BUF_X1 output14 (.A(net14),
    .Z(halt_out));
 BUF_X1 output15 (.A(net15),
    .Z(pc_out[0]));
 BUF_X1 output16 (.A(net16),
    .Z(pc_out[1]));
 BUF_X1 output17 (.A(net17),
    .Z(pc_out[2]));
 BUF_X1 output18 (.A(net18),
    .Z(pc_out[3]));
 BUF_X1 output19 (.A(net19),
    .Z(pc_out[4]));
 BUF_X1 output2 (.A(net2),
    .Z(alu_result_out[0]));
 BUF_X1 output20 (.A(net20),
    .Z(pc_out[5]));
 BUF_X1 output21 (.A(net21),
    .Z(pc_out[6]));
 BUF_X1 output22 (.A(net22),
    .Z(pc_out[7]));
 BUF_X1 output23 (.A(net23),
    .Z(reg_write_out));
 BUF_X1 output3 (.A(net3),
    .Z(alu_result_out[1]));
 BUF_X1 output4 (.A(net4),
    .Z(alu_result_out[2]));
 BUF_X1 output5 (.A(net5),
    .Z(alu_result_out[3]));
 BUF_X1 output6 (.A(net6),
    .Z(alu_result_out[4]));
 BUF_X1 output7 (.A(net7),
    .Z(alu_result_out[5]));
 BUF_X1 output8 (.A(net8),
    .Z(alu_result_out[6]));
 BUF_X1 output9 (.A(net9),
    .Z(alu_result_out[7]));
 DFFR_X1 \u_pc.pc[0]$_DFFE_PP0P_  (.D(_075_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(net15),
    .QN(_000_));
 DFFR_X1 \u_pc.pc[1]$_DFFE_PP0P_  (.D(_074_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(net16),
    .QN(_001_));
 DFFR_X1 \u_pc.pc[2]$_DFFE_PP0P_  (.D(_073_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(net17),
    .QN(_317_));
 DFFR_X1 \u_pc.pc[3]$_DFFE_PP0P_  (.D(_072_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(net18),
    .QN(_318_));
 DFFR_X1 \u_pc.pc[4]$_DFFE_PP0P_  (.D(_071_),
    .RN(_068_),
    .CK(clknet_1_1__leaf_clk),
    .Q(net19),
    .QN(_319_));
 DFFR_X1 \u_pc.pc[5]$_DFFE_PP0P_  (.D(net26),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(net20),
    .QN(_320_));
 DFFR_X1 \u_pc.pc[6]$_DFFE_PP0P_  (.D(_069_),
    .RN(_068_),
    .CK(clknet_1_1__leaf_clk),
    .Q(net21),
    .QN(_321_));
 DFFR_X1 \u_pc.pc[7]$_DFFE_PP0P_  (.D(net25),
    .RN(_068_),
    .CK(clknet_1_1__leaf_clk),
    .Q(net22),
    .QN(_305_));
 DFFR_X1 \u_register_file.reg_file[0][0]$_DFFE_PP0P_  (.D(_093_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\read_data1_w[0] ),
    .QN(_056_));
 DFFR_X1 \u_register_file.reg_file[0][1]$_DFFE_PP0P_  (.D(_092_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\read_data1_w[1] ),
    .QN(_002_));
 DFFR_X1 \u_register_file.reg_file[0][2]$_DFFE_PP0P_  (.D(_091_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\read_data1_w[2] ),
    .QN(_028_));
 DFFR_X1 \u_register_file.reg_file[0][3]$_DFFE_PP0P_  (.D(_090_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\read_data1_w[3] ),
    .QN(_023_));
 DFFR_X1 \u_register_file.reg_file[0][4]$_DFFE_PP0P_  (.D(_089_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\read_data1_w[4] ),
    .QN(_018_));
 DFFR_X1 \u_register_file.reg_file[0][5]$_DFFE_PP0P_  (.D(_088_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\read_data1_w[5] ),
    .QN(_013_));
 DFFR_X1 \u_register_file.reg_file[0][6]$_DFFE_PP0P_  (.D(_087_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\read_data1_w[6] ),
    .QN(_008_));
 DFFR_X1 \u_register_file.reg_file[0][7]$_DFFE_PP0P_  (.D(_095_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\read_data1_w[7] ),
    .QN(_063_));
 DFFR_X1 \u_register_file.reg_file[1][0]$_DFFE_PP0P_  (.D(_086_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[1][0] ),
    .QN(_306_));
 DFFR_X1 \u_register_file.reg_file[1][1]$_DFFE_PP0P_  (.D(_085_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[1][1] ),
    .QN(_307_));
 DFFR_X1 \u_register_file.reg_file[1][2]$_DFFE_PP0P_  (.D(_084_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[1][2] ),
    .QN(_308_));
 DFFR_X1 \u_register_file.reg_file[1][3]$_DFFE_PP0P_  (.D(_083_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[1][3] ),
    .QN(_309_));
 DFFR_X1 \u_register_file.reg_file[1][4]$_DFFE_PP0P_  (.D(_082_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[1][4] ),
    .QN(_310_));
 DFFR_X1 \u_register_file.reg_file[1][5]$_DFFE_PP0P_  (.D(_081_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\u_register_file.reg_file[1][5] ),
    .QN(_311_));
 DFFR_X1 \u_register_file.reg_file[1][6]$_DFFE_PP0P_  (.D(_080_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\u_register_file.reg_file[1][6] ),
    .QN(_312_));
 DFFR_X1 \u_register_file.reg_file[1][7]$_DFFE_PP0P_  (.D(_096_),
    .RN(net24),
    .CK(clknet_1_0__leaf_clk),
    .Q(\u_register_file.reg_file[1][7] ),
    .QN(_304_));
 DFFR_X1 \u_register_file.reg_file[5][3]$_DFFE_PP0P_  (.D(_079_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[5][3] ),
    .QN(_313_));
 DFFR_X1 \u_register_file.reg_file[5][4]$_DFFE_PP0P_  (.D(_078_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[5][4] ),
    .QN(_314_));
 DFFR_X1 \u_register_file.reg_file[7][3]$_DFFE_PP0P_  (.D(_077_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[7][3] ),
    .QN(_315_));
 DFFR_X1 \u_register_file.reg_file[7][4]$_DFFE_PP0P_  (.D(_076_),
    .RN(net24),
    .CK(clknet_1_1__leaf_clk),
    .Q(\u_register_file.reg_file[7][4] ),
    .QN(_316_));
endmodule
