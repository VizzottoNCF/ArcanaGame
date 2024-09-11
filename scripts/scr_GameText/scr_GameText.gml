function gf_game_text(_text_id)
{
	/*
	Rafa: Minha sanidade acabou há muito tempo...  
	⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣻⣿⣿⣿⣿⠿⠿⠶⢾⣿⣿⣿⣿⣿⣿⣿⣿ 
	⣿⣿⣿⣿⣿⣿⣿⣯⡿⠿⠿⠛⠛⠋⠉⠉⠄⠄⠄⠄⠄⠄⢹⣿⣿⣿⣿⣿⣿⣿ 
	⣿⣿⣿⣯⡿⠋⠁⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⣀⠄⠄⠄⠄⠄⢻⣿⢿⣿⣿⣿⣿ 
	⣿⣿⣿⠋⠄⠄⠄⠄⠄⠄⠄⠄⢴⣶⠿⠛⠛⠉⠄⠄⠄⠄⠄⠄⢿⣾⣿⣿⣿⣿ 
	⣿⣿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣿⡆⠄⠄⢀⡀⠄⠄⠄⠄⠄⠈⣿⣽⣿⣿⣿ 
	⣿⣿⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠹⣿⡾⠿⠛⠁⠄⠄⠄⠄⠄⠄⠸⣿⣿⣿⣿ 
	⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣯⣿⣿ 
	⣿⣽⣿⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠸⣿⣾⣿ 
	⣿⣿⣿⣇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿ 
	⣿⣿⣾⣿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿ 
	⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿ 
	⣿⣿⣿⣿⣿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⣠⣼⣿⣾⣿ 
	⣿⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⣤⣤⣶⣾⣟⣟⣽⣿⣿⣿⣿ 
	⣿⣿⣿⣿⣯⣿⣆⠄⠄⠄⢀⣀⣠⣤⣶⣾⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ 
	⣿⣿⣿⣿⣿⣿⣿⢷⣾⢿⣿⣿⣯⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	*/
	
	
	switch(_text_id)
	{
		#region EXEMPLO
		case "Exemplo - Opcao":
			gf_text("Texto", "Falante")
			/// parametros são: 
			/// _start: pos do 1° caractere da sequencia
			/// _end: pos do último caractere da sequencia
			/// _col1 -> _col4: cor de cada um dos 4 quantos
			scr_text_color(0, 3, c_white, c_red, c_yellow, c_green)
			
			/// parametros são: 
			/// _start: pos do 1° caractere da sequencia
			/// _end: pos do último caractere da sequencia
			scr_text_float(0,3)
			
			/// parametros são: 
			/// _start: pos do 1° caractere da sequencia
			/// _end: pos do último caractere da sequencia
			scr_text_shake(0,3)
			
			/// parametros são: 
			/// _start: pos do 1° caractere da sequencia
			/// _end: pos do último caractere da sequencia
			scr_text_big(0,3)
			
			// Após o final de um case, antes do "break;", podemos inserir opções que continuam o diálogo usando
			//gf_option(Texto na Opcao, "Case da Opcao")
			gf_option("Opcao", "Exemplo - Opcao")
			break;
/*				case "Exemplo - Opcao":
				gf_text("Texto", "Falante")
				break;*/
			
			
		#endregion
		case "save":
			gf_text("ABC abcaaaaaaaa aaaaa aaaaaaaa aaaaaaaaaaa aaaaaaa aaaaaaaaaaaaaaaaa")
			break;
		
	}
}