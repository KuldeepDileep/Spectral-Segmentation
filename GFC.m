function val = GFC(sp1, sp2)
    num = abs(sum(sp1.*sp2));
    denom = abs(sum(sp1.^2))^0.5*abs(sum(sp2.^2))^0.5;
    val = num/denom;
end