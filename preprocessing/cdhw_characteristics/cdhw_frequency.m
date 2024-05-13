function count = cdhw_frequency(sequence,a)
    count = 0;
    consecutive_count = 0;
    has_counted = false;

    for i = 1:length(sequence)
        num = sequence(i);
        if num > 0
            consecutive_count = consecutive_count + 1;
            if consecutive_count >= a && ~has_counted
                count = count + 1;
                has_counted = true;
            end
        else
            consecutive_count = 0;
            has_counted = false;
        end
    end
end