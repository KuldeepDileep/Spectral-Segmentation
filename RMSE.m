function val = RMSE(sp1, sp2)
    n = size(sp1,1);
    val = sqrt((1/n)*sum((sp1-sp2).^2));
end