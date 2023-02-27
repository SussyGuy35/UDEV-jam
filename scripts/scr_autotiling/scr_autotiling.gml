/// @function autotile_get_tile(object, tile_width)
function autotile_get_tile(obj,tile_width){
	var _up, _down, _left, _right, _upleft, _upright, _downleft, _downright
	_up = place_meeting(x,y-1,obj)
	_down = place_meeting(x,y+1,obj)
	_left = place_meeting(x-1,y,obj)
	_right = place_meeting(x+1,y,obj)
	_upleft = place_meeting(x-tile_width,y-tile_width,obj)
	_upright = place_meeting(x+tile_width,y-tile_width,obj)
	_downleft = place_meeting(x-tile_width,y+tile_width,obj)
	_downright = place_meeting(x+tile_width,y+tile_width,obj)
	if (_up){
		if (_left){
			if (_right){
				if (_down){
					if (_upleft){
						if (_upright){
							if (_downleft){
								if (_downright) return choose(7,23,31)
								if (!_downright) return 32
							}
							if (!_downleft){
								if (_downright) return 33
								if (!_downright) return 37
							}
						}
						if (!_upright){
							if (_downleft){
								if (!_downright) return 35
								if (_downright) return 48
							}
							if (!_downleft){
								if (!_downright) return 42
								if (_downright) return 45
							}
						}
					}
					if (!_upleft){
						if (_upright){
							if (_downleft){
								if (!_downright) return 46
								if (_downright) return 47
							}
							if (!_downleft){
								if (_downright) return 34
								if (!_downright) return 41
							}
						}
						if (!_upright){
							if (_downleft){
								if (_downright) return 36
								if (!_downright) return 43
							}
							if (!_downleft){
								if (!_downright) return 40
								if (_downright) return 44
							}
						}
					}
				}
				if (!_down){
					if (_upleft){
						if (_upright) return 3
						if (!_upright) return 28
					}
					if (!_upleft){
						if (_upright) return 27
						if (!_upright) return 29
					}
				}
			}
			if (!_right){
				if (_down){
					if (_downleft){
						if (_upleft) return 2
						if (!_upleft) return 24
					}
					if (!_downleft){
						if (_upleft) return 25
						if (!_upleft) return 26
					}
				}
				if (!_down){
					if (_upleft) return 13
					if (!_upleft) return 17
				}
			}
		}
		if (!_left){
			if (_right){
				if (_down){
					if (_downright){
						if (_upright) return 1
						if (!_upright) return 19
					}
					if (!_downright){
						if (_upright) return 20
						if (!_upright) return 21
					}
				}
				if (!_down) {
					if (_upright) return 12
					if (!_upright) return 16
				}
			}
			if (!_right){
				if (_down) return 14
				if (!_down) return 30
			}
		}
	}
	if (!_up){
		if (_left){
			if (_right){
				if (_down){
					if (_downright){
						if (_downleft) return 0
						if (!_downleft) return 10
					}
					if (!_downright){
						if (_downleft) return 11
						if (!_downleft) return 18
					}
				}
				if (!_down){
					return 6
				}
			}
			if (!_right){
				if (_down){
					if (_downleft) return 5
					if (!_downleft) return 9
				}
				if (!_down){
					return 39
				}
			}
		}
		if (!_left){
			if (_right){
				if (_down){
					if (_downright) return 4
					if (!_downright) return 8
				}
				if (!_down){
					return 38
				}
			}
			if (!_right){
				if (_down) return 22
				if (!_down) return 15
			}
		}
	}
}