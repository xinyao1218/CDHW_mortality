function twas_daily = trans_daily(sequence)
    twas_daily = ones(64,67,58439);

    n1=0;
    n2=0;
    day=[31 28 31 30 31 30 31 31 30 31 30 31];


    for i=1:160
        for j=1:12
            n1=n2+1;
            n2=n2+day(j);
            if mod(1940+i, 4) == 0 && j==2
                if mod(1940+i, 100) ~= 0 || mod(1940+i, 400) == 0
                    n2=n2+1;
                end
            end
            twas_daily(:,:,n1:n2)=repmat(sequence(:,:,(i-1)*12+j), [1, 1, n2-n1+1]);
        end
    end
end




