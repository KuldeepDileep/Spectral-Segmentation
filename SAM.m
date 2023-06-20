function val = SAM(sp1,sp2)
    num = sum(sp1.*sp2);
    denom = sqrt(sum(sp1.^2)*sum(sp2.^2));
    val = acos(num/denom);
end