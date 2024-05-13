function duration = d_duration(sequence)

    sequence(sequence>0)=1;
    temp=sequence;
    sequence(1)=sequence(1)*31;
    sequence(2)=sequence(2)*28;
    sequence(3)=sequence(3)*31;
    sequence(4)=sequence(4)*30;
    sequence(5)=sequence(5)*31;
    sequence(6)=sequence(6)*30;
    sequence(7)=sequence(7)*31;
    sequence(8)=sequence(8)*31;
    sequence(9)=sequence(9)*30;
    sequence(10)=sequence(10)*31;
    sequence(11)=sequence(11)*30;
    sequence(12)=sequence(12)*31;

    duration=sum(sequence)/sum(temp);

