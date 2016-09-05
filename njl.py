from future import division
from scipy.optimize import fsolve
from scipy.special import gamma
from scipy.integrate import fixed_quad

def myfunc(x, y, theta):
gmp = gamma(x+y) / (gamma(x)+gamma(y))
return gmp * theta(x-1) * (1-theta)(y-1)

def equations(p):
x, y = p
intg1 = fixed_quad(myfunc, 0, 0.6, args=(x, y))
intg2 = fixed_quad(myfunc, 0.9, 1, args=(x, y))
return (intg1[0] - 0.05, intg2[0] - 0.05)
xr, yr = fsolve(equations, (1, 1)) print equations((xr, yr))
