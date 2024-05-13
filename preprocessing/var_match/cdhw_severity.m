function  severity = cdhw_severity(sequence,a)
    severity_list(1,1) = 0;
    consecutive_count = 0;
    count = 0;
    temp = 0;

    for i = 1:length(sequence)
        num = sequence(i);
        if num > 0
            temp = temp+num;
            consecutive_count = consecutive_count + 1;
            if consecutive_count == a 
                count = count+1;
                severity_list(count,1) = temp;
            elseif consecutive_count > a 
                severity_list(count,1) = temp;
            end
        else
            consecutive_count = 0;
            temp=0;
        end
    end

    severity=mean(severity_list);
end



    