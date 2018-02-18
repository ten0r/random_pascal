var
	i: integer;
	number, sum: integer;
	fin, fout: text;
begin
	if ParamCount<>2 then begin
		writeln('Please specify input and output files.');
		writeln('Run: ', ParamStr(0), ' infile outfile');
		halt(1);
	end;
	assign(fin, Paramstr(1));
	assign(fout, Paramstr(2));
	reset(fin);
	rewrite(fout);
	i:=0;
	sum:=0;
	while (i<10) and (not eof(fin)) do begin
		read(fin, number);
		inc(i);
		if i mod 2 = 0 then sum:=sum+number;
		write(fout, number);
		if i<10 then
			write(fout, ' ')
		else
			writeln(fout, '');
	end;
	writeln(fout, sum);
	close(fin);
	close(fout);
end.
