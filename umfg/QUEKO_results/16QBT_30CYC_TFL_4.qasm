include "qelib1.inc";
gate intrinsic_swap__ a, b {
	cx a, b;
	cx b, a;
	cx a, b;
}
gate intrinsic_rev_cx__ a, b {
	h a;
	h b;
	cx b, a;
	h b;
	h a;
}
qreg q[16];
u3(pi, 0, pi) q[3];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[6];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[5];
u3(pi, 0, pi) q[12];
u3(pi, 0, pi) q[12];
u3(pi, 0, pi) q[14];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[6];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[15];
cx q[4], q[3];
cx q[0], q[1];
u3(pi, 0, pi) q[14];
cx q[4], q[3];
cx q[7], q[10];
intrinsic_swap__ q[1], q[2];
intrinsic_swap__ q[2], q[3];
intrinsic_swap__ q[4], q[3];
intrinsic_swap__ q[4], q[5];
intrinsic_swap__ q[12], q[5];
intrinsic_rev_cx__ q[11], q[12];
intrinsic_rev_cx__ q[4], q[13];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[14];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[4];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[15];
intrinsic_rev_cx__ q[3], q[2];
intrinsic_swap__ q[12], q[5];
intrinsic_swap__ q[12], q[11];
cx q[6], q[11];
intrinsic_swap__ q[9], q[10];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[15], q[14];
intrinsic_rev_cx__ q[0], q[15];
u3(pi, 0, pi) q[3];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[14];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[4];
u3(pi, 0, pi) q[6];
u3(pi, 0, pi) q[5];
intrinsic_swap__ q[7], q[10];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[13], q[14];
cx q[15], q[14];
intrinsic_swap__ q[8], q[7];
intrinsic_swap__ q[7], q[10];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[3], q[14];
intrinsic_swap__ q[2], q[3];
cx q[1], q[2];
intrinsic_swap__ q[15], q[0];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_rev_cx__ q[11], q[12];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[6];
intrinsic_swap__ q[3], q[14];
cx q[15], q[14];
u3(pi, 0, pi) q[12];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[11];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[12], q[11];
cx q[6], q[11];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[5];
cx q[4], q[5];
intrinsic_swap__ q[9], q[10];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[13], q[14];
cx q[3], q[14];
intrinsic_rev_cx__ q[1], q[0];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[3];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[13];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[11], q[10];
cx q[9], q[10];
cx q[1], q[2];
cx q[4], q[5];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[2];
cx q[9], q[10];
intrinsic_rev_cx__ q[13], q[12];
cx q[4], q[5];
intrinsic_swap__ q[8], q[7];
cx q[6], q[7];
intrinsic_swap__ q[15], q[14];
cx q[3], q[14];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[9];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[7], q[10];
cx q[8], q[7];
cx q[1], q[2];
intrinsic_swap__ q[3], q[14];
intrinsic_swap__ q[4], q[3];
intrinsic_rev_cx__ q[5], q[4];
intrinsic_swap__ q[11], q[10];
cx q[9], q[10];
cx q[8], q[7];
intrinsic_swap__ q[15], q[14];
intrinsic_rev_cx__ q[0], q[15];
intrinsic_rev_cx__ q[5], q[4];
cx q[6], q[11];
intrinsic_swap__ q[3], q[14];
cx q[2], q[3];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[15];
cx q[9], q[10];
cx q[6], q[11];
intrinsic_swap__ q[4], q[5];
intrinsic_swap__ q[4], q[3];
intrinsic_rev_cx__ q[14], q[3];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[13];
intrinsic_swap__ q[8], q[7];
intrinsic_swap__ q[7], q[10];
cx q[11], q[10];
intrinsic_swap__ q[3], q[14];
cx q[4], q[3];
intrinsic_swap__ q[4], q[5];
intrinsic_swap__ q[4], q[3];
intrinsic_rev_cx__ q[14], q[3];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[7];
cx q[6], q[11];
cx q[1], q[2];
intrinsic_rev_cx__ q[14], q[3];
intrinsic_swap__ q[8], q[7];
cx q[9], q[8];
intrinsic_swap__ q[1], q[2];
intrinsic_swap__ q[2], q[3];
intrinsic_swap__ q[4], q[3];
intrinsic_swap__ q[4], q[5];
cx q[12], q[5];
intrinsic_swap__ q[4], q[3];
intrinsic_swap__ q[2], q[3];
cx q[1], q[2];
intrinsic_swap__ q[15], q[0];
intrinsic_swap__ q[15], q[14];
cx q[13], q[14];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[6];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[5];
u3(pi, 0, pi) q[1];
intrinsic_rev_cx__ q[10], q[7];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[3], q[14];
cx q[4], q[3];
intrinsic_swap__ q[15], q[14];
intrinsic_rev_cx__ q[0], q[15];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[15];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[13];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[7], q[10];
cx q[8], q[7];
intrinsic_swap__ q[1], q[2];
intrinsic_swap__ q[2], q[3];
intrinsic_swap__ q[4], q[3];
intrinsic_rev_cx__ q[5], q[4];
intrinsic_swap__ q[9], q[10];
intrinsic_swap__ q[7], q[10];
cx q[6], q[7];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[6];
intrinsic_rev_cx__ q[5], q[4];
intrinsic_swap__ q[15], q[0];
intrinsic_rev_cx__ q[14], q[15];
u3(pi, 0, pi) q[3];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[8];
intrinsic_swap__ q[12], q[5];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[10], q[11];
intrinsic_swap__ q[1], q[2];
intrinsic_swap__ q[2], q[3];
cx q[4], q[3];
intrinsic_swap__ q[9], q[10];
intrinsic_swap__ q[11], q[10];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[13], q[12];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[14];
u3(pi, 0, pi) q[6];
u3(pi, 0, pi) q[8];
u3(pi, 0, pi) q[13];
cx q[15], q[0];
intrinsic_rev_cx__ q[11], q[12];
cx q[4], q[3];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[4];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[5];
u3(pi, 0, pi) q[2];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[0];
cx q[13], q[14];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[4];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[15];
u3(pi, 0, pi) q[12];
intrinsic_rev_cx__ q[8], q[9];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[10], q[11];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[4];
u3(pi, 0, pi) q[5];
u3(pi, 0, pi) q[12];
u3(pi, 0, pi) q[15];
cx q[9], q[10];
cx q[6], q[7];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_rev_cx__ q[14], q[13];
intrinsic_rev_cx__ q[2], q[1];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[14];
cx q[4], q[3];
intrinsic_swap__ q[15], q[14];
cx q[13], q[14];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[5], q[12];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[6];
cx q[4], q[3];
intrinsic_swap__ q[13], q[14];
cx q[15], q[14];
intrinsic_swap__ q[15], q[0];
intrinsic_swap__ q[15], q[14];
cx q[13], q[14];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[6];
intrinsic_rev_cx__ q[7], q[8];
intrinsic_rev_cx__ q[2], q[1];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[15], q[14];
intrinsic_rev_cx__ q[0], q[15];
u3(pi, 0, pi) q[13];
u3(pi, 0, pi) q[0];
u3(pi, 0, pi) q[15];
u3(pi, 0, pi) q[14];
cx q[9], q[10];
intrinsic_rev_cx__ q[3], q[2];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[5], q[12];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[7];
u3(pi, 0, pi) q[12];
u3(pi, 0, pi) q[15];
u3(pi, 0, pi) q[13];
intrinsic_swap__ q[15], q[14];
intrinsic_rev_cx__ q[0], q[15];
u3(pi, 0, pi) q[9];
u3(pi, 0, pi) q[1];
u3(pi, 0, pi) q[14];
u3(pi, 0, pi) q[8];
intrinsic_rev_cx__ q[5], q[12];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[12], q[11];
intrinsic_rev_cx__ q[10], q[11];
intrinsic_rev_cx__ q[3], q[2];
u3(pi, 0, pi) q[10];
u3(pi, 0, pi) q[11];
u3(pi, 0, pi) q[6];
intrinsic_swap__ q[15], q[0];
intrinsic_swap__ q[15], q[14];
intrinsic_swap__ q[13], q[14];
intrinsic_swap__ q[12], q[13];
intrinsic_swap__ q[12], q[11];
intrinsic_swap__ q[11], q[10];
cx q[9], q[10];
intrinsic_swap__ q[15], q[14];
cx q[13], q[14];
cx q[15], q[0];
