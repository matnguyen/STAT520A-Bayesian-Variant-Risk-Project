data {
  int<lower = 1> N;
  
  vector[N] freq;
  int num[N];
  int<lower=0> y[N];
  int<lower=0, upper=1> Z[N];
}

parameters{
  real<lower=0, upper=1> eta;
  vector<lower=0>[N] gamma;
}

model {
  eta ~ beta(1, 100);
  
  for (n in 1:N) {
    gamma[n] ~ gamma(2, 1);
    Z[n] ~ bernoulli(eta);
    
    if (Z[n] == 0) {
      y[n] ~ binomial(num[n], freq[n]);
    }
    else {
      y[n] ~ binomial(num[n], freq[n] * gamma[n]);
    }
  }
}
