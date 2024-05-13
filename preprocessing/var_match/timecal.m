function time = timecal(sequence,year)
    r=length(sequence);
    time = ones(r,1);


    day=[0 31 59 90 120 151 181 212 243 273 304 334];


    for i=1:r
        time(i,1)=(sequence(i,1)-year)*365+day(sequence(i,2))+sequence(i,3);
    end
end