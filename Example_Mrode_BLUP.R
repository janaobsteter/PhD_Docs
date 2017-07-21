X <- matrix (nrow = 5 , ncol = 2, c(1,0,0,1,1,0,1,1,0,0))
Z <- matrix (nrow = 5 , ncol = 8, c(rep(0,15), 1, rep(c(rep(0, 5),1),4)))
y <- as.vector(c(4.5, 2.9, 3.9, 3.5, 5.0))

XtZ = t(X)%*%Z
ZtX = t(XtZ)
Xty <- t(X) %*% y
Zty <- t(Z) %*% y
ZtZ <- t(Z) %*% Z
XtX <- t(X) %*% X

LSEU <- cbind(XtX, XtZ)
LSEL <- cbind(ZtX, ZtZ)
LSE <- rbind(LSEU, LSEL)
yT <- rbind(Xty, Zty)

