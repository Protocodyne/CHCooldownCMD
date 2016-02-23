bind(player_command, null, null, @e,

	try(
	
		@config = yml_decode(read("config.yml"))

		foreach(@world: @cmdArray in @config['worlds']){
		
			if(pworld(player()) == @world){
		
				@pcmd = @e['command']
				foreach(@cmd in @cmdArray){
				
					if(_contains(@pcmd, @cmd)){
					
						cancel()
						@cool = 3
						@loc = _int_cd(ploc(player()))
						export(@with, @e['command'])
						
						if(!@cool){
						
							assign(@task, set_interval(1000, closure(){
							
								@cool -= 1
								if(@cool <= 0){
								
									run(@cmd)
									clear_task(@task)
								
								}else if(!@loc == _int_cmd(ploc(player()))){
								
									msg(colorize("&c�����̼ż� ��ҵǾ����ϴ�."))
									@cool = false
								
								}else{
								
									msg(colorize("&c���ɾ� ������ &f" .@cool "&c�� ���ҽ��ϴ�."))
								
								}
							
							}))
						
						}
					
					}
				
				}
		
			}
		
		}
	
	,
	
		chd_write("config_broken.yml", read("config.yml"));
		chd_write("config.yml", read("./rsc/config.yml"));
	
	)

)