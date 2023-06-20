function val = SCM(sp1,sp2)
    num = sum( (sp1-mean(sp1)).*(sp2-mean(sp2)) );
    denom = sqrt( sum((sp1-mean(sp1)).^2) * sum( (sp2-mean(sp2)).^2 ));
    val = num/denom;
end