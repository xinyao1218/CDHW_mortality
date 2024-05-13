function duration = cdhw_duration(sequence,a)
    duration_list(1,1) = 0;
    consecutive_count = 0;
    count = 0;

    for i = 1:length(sequence)
        num=sequence(i);
        if num > 0
            consecutive_count = consecutive_count + 1;
            if consecutive_count == a 
                count = count+1;
                duration_list(count,1) = consecutive_count;
            elseif consecutive_count > a 
                duration_list(count,1) = consecutive_count;
            end
        else
            consecutive_count = 0;
        end
    end

    duration=mean(duration_list);
end