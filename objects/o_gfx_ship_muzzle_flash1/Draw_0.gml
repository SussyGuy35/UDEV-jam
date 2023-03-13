draw_ellipse_color(x - mf_w * mf_scale, 
					y - mf_h * mf_scale, 
					x + mf_w * mf_scale, 
					y + mf_h * mf_scale,
					mf_color1, 
					mf_color2,
					false);
					
mf_scale -= mf_scale_decay;
if(mf_scale <= 0) instance_destroy();