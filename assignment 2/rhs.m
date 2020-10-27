function dxdt = rhs(t,x,m1,m2,kw,ks,b)

    dxdt = [x(3); x(4); (-kw*(x(1)-exp(-t)*sin(t))/m1)-(ks*(x(1)-x(2))/m1)-(b*(x(3)-x(4))/m1); (-ks*(x(2)-x(1)))/m2-(b*(x(4)-x(3)))/m2];
end