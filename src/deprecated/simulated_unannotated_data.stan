data {
  real beta_alpha; 
  real beta_beta;
  
  real gamma_alpha;
  real gamma_beta;
  
  int poisson_lambda;
  
  int<lower = 1> N; // Number of observations
}

generated quantities{
  vector[N] gamma;
  vector[N] z;
  vector[N] y;
  real freq;
  int num;
  vector[N] all_freq;
  vector[N] all_num;
  
  real eta = beta_rng(beta_alpha, beta_beta);
  
  for (n in 1:N) {
    num = poisson_rng(poisson_lambda) + 1;
    all_num[n] = num;
    freq = (num * 1.0) / N;
    all_freq[n] = freq;
    gamma[n] = gamma_rng(gamma_alpha, gamma_beta);
    z[n] = bernoulli_rng(eta);
    
    if (z[n] == 0) {
      y[n] = binomial_rng(num, freq);
    }
    else {
      y[n] = binomial_rng(num, freq * gamma[n]);
    }
  }
}
