{ config, pkgs, ... }:

{
    home.file.".XCompose".text = ''
        include "%L"

        <Multi_key> <A> <A>	    		: "Ä"	Adiaeresis # LATIN CAPITAL LETTER A WITH DIAERESTS
        <Multi_key> <a> <a>		    	: "ä"	adiaeresis # LATIN SMALL LETTER A WITH DIAERESIS
        <Multi_key> <U> <U>			    : "Ü"	Udiaeresis # LATIN CAPITAL LETTER U WITH DIAERESIS
        <Multi_key> <u> <u>    			: "ü"	udiaeresis # LATIN SMALL LETTER U WITH DIAERESIS
        <Multi_key> <O> <O>	    		: "Ö"	Odiaeresis # LATIN CAPITAL LETTER O WITH DIAERESIS
        <Multi_key> <o> <o>		    	: "ö"	odiaeresis # LATIN SMALL LETTER O WITH DIAERESIS
        <Multi_key> <S> <S>		    	: "ẞ"	U1e9e  	# LATIN CAPITAL LETTER SHARP S
        <Multi_key> <s> <s>		    	: "ß"	ssharp 	# LATIN SMALL LETTER SHARP S
        <Multi_key> <equal> <equal>		: "‑̈"   U0308  	# HYPHEN WITH DIAERESIS
    '';
}
