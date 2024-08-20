library(psych)
library(gplots)

scaled <- read.csv("~/Desktop/Psych 101/Final Project/Scaled Final Project Data.csv")

#### ecs Scale

ecs.DF <- with(scaled, data.frame(ec_scaled, stress1, stress2, stress3))
# ecs.DF <- ecs.DF[1:11 , ]
ecs.DF

scaled$STRESS <- rowMeans(ecs.DF, na.rm = T)
par(mfrow = c(1,1))
hist(scaled$STRESS, main = "Title : Histogram of ecs", 
     xlab = "Average of ecs")

#### dout Scale

dOUT.DF <- with(scaled, data.frame(dance_scaled, co1, co2, co3, co4, 6 - co5, co6))
dOUT.DF

scaled$COU <- rowMeans(dOUT.DF, na.rm = T)
par(mfrow = c(1,1))
hist(scaled$COU, main = "Title : Histogram of COU", 
     xlab = "Average of COU")

#### creativity Scale

CREATIVITY.DF <- with(scaled, data.frame(co4, 6 - co5))
CREATIVITY.DF
scaled$CREATIVITY <- rowMeans(CREATIVITY.DF, na.rm = T)
par(mfrow = c(1,1))
hist(scaled$CREATIVITY, main = "Title : Histogram of CREATIVITY", 
     xlab = "Average of CREATIVITY")

##################################################################

# DV graph -> creativity

hist(scaled$CREATIVITY, main = "Title : Histogram of CREATIVITY", 
     xlab = "Average of CREATIVITY", xlim = c(1, 5))
alpha(CREATIVITY.DF)
mean(scaled$CREATIVITY, na.rm = T)
sd(scaled$CREATIVITY, na.rm = T)
range(scaled$CREATIVITY, na.rm = T)

# IV graph -> stress

hist(scaled$STRESS, main = "Title : Histogram of STRESS", 
     xlab = "Average of STRESS", xlim = c(1, 5))
alpha(STRESS.DF)
mean(scaled$STRESS, na.rm = T)
sd(scaled$STRESS, na.rm = T)
range(scaled$STRESS, na.rm = T)

# IV graph -> COU

hist(scaled$COU, main = "Title : Histogram of CREATIVE OUTLET USE", 
     xlab = "Average of CREATIVE OUTLET USE", xlim = c(1, 5))
alpha(dOUT.DF)
mean(scaled$COU, na.rm = T)
sd(scaled$COU, na.rm = T)
range(scaled$COU, na.rm = T)

##################################################################

# Model 1: DV ~ IV1 = creativity ~ stress

mod_cs <- lm(CREATIVITY ~ STRESS, data = scaled)
coef(mod_cs)
plot(CREATIVITY ~ STRESS, data = scaled, main = "CREATIVITY vs. STRESS", xlab = "CREATIVITY", ylab = "STRESS")
abline(mod_cs, lwd = 5, col = "blue")

bucket_cs <- array()
for(i in c(1:1000)){
  boot.scaled <- scaled[sample(1:nrow(scaled), nrow(scaled), replace = T),]
  boot.mod_cs <- lm(CREATIVITY ~ STRESS, data = boot.scaled)
  bucket_cs[i] <- coef(boot.mod_cs)[2]
}

hist(bucket_cs)

# original
coef(mod_cs)[2]
# (5 % 1.96 sd below the slope)
round(coef(mod_cs)[2] - 1.96 * sd(bucket_cs), 2) 
# (5 % 1.96 sd above the slope)
round(coef(mod_cs)[2] + 1.96 * sd(bucket_cs), 2) 

summary(mod_cs)$r.squared

# Model 2: DV ~ IV2 = creativity ~ outlet use
mod_cou <- lm(CREATIVITY ~ COU, data = scaled)
coef(mod_cou)
plot(CREATIVITY ~ COU, data = scaled, main = "CREATIVITY vs. CREATIVE OUTLET USE", xlab = "CREATIVITY", ylab = "CREATIVE OUTLET USE")
abline(mod_cou, lwd = 5, col = "pink")

bucket_cou <- array()
for(i in c(1:1000)){
  boot.scaled <- scaled[sample(1:nrow(scaled), nrow(scaled), replace = T),]
  boot.mod_cou <- lm(CREATIVITY ~ COU, data = boot.scaled)
  bucket_cou[i] <- coef(boot.mod_cou)[2]
}

hist(bucket_cou)

# original
coef(mod_cou)[2]
# (5 % 1.96 sd below the slope)
round(coef(mod_cou)[2] - 1.96 * sd(bucket_cou), 2) 
# (5 % 1.96 sd above the slope)
round(coef(mod_cou)[2] + 1.96 * sd(bucket_cou), 2) 

summary(mod_cou)$r.squared

# Model 3: DV ~ IV1 + IV2 \
mod_all <- lm(CREATIVITY ~ STRESS + COU, data = scaled)
coef(mod_all)
summary(mod_all)

##################################################################

# Model 1: DV ~ IV1 = creativity ~ stress

mod_cs <- lm(CREATIVITY ~ STRESS, data = scaled)
standardize(mod_cs, NULL, T)
coef(mod_cs)
par(mfrow = c(1,1))
plot(CREATIVITY ~ STRESS, data = scaled, main = "CREATIVITY vs. STRESS", xlab = "CREATIVITY", ylab = "STRESS")
abline(mod_cs, lwd = 5, col = "blue")
summary(mod_cs)$r.squared
summary(mod_cs)

# Model 2: DV ~ IV2 = creativity ~ outlet use
mod_cou <- lm(CREATIVITY ~ COU, data = scaled)
standardize(mod_cou, NULL, T)
coef(mod_cou)
par(mfrow = c(1,1))
plot(CREATIVITY ~ COU, data = scaled, main = "CREATIVITY vs. CREATIVE OUTLET USE", xlab = "CREATIVITY", ylab = "CREATIVE OUTLET USE")
abline(mod_cou, lwd = 5, col = "pink")
summary(mod_cou)$r.squared
summary(mod_cou)

# Model 3: DV ~ IV1 + IV2 \
mod_all <- lm(CREATIVITY ~ STRESS + COU, data = scaled)
standardize(mod_all, NULL, T)
coef(mod_all)
summary(mod_all)$r.squared
summary(mod_all)

##################

coef(mod_cs)[2] - 1.96 * 0.4628
coef(mod_cs)[2] + 1.96 * 0.4628

coef(mod_cou)[2] - 1.96 * 0.1409
coef(mod_cou)[2] + 1.96 * 0.1409

coef(mod_all)[2] - 1.96 * 0.314811 
coef(mod_all)[2] + 1.96 * 0.314811 

coef(mod_all)[3] - 1.96 * 0.143573 
coef(mod_all)[3] + 1.96 * 0.143573 
coef(mod_all)[3]
