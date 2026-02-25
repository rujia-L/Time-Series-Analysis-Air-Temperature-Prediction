# Time Series Analysis & Air Temperature Prediction (Box–Jenkins ARMAX + Kalman Filter)

## Overview
This project builds high-accuracy predictors for local outdoor **air temperature** in **Højbakkegaard (Taastrup, Denmark)** using classical time-series methodology:

- **Box–Jenkins / ARMAX** modeling with exogenous radiation inputs
- **Recursive prediction** via **Kalman filtering** for online parameter updating

Course project at Lund University (Mathematical Statistics). :contentReference[oaicite:3]{index=3}

## Dataset
The dataset contains multi-year measurements of air temperature and radiation-related variables (e.g., net radiation, reflected shortwave radiation, earth heat flux).
In the final solution, net radiation is used as the primary external input in the Box–Jenkins model. 

### Data splitting (used in the report)
- Training: an ~8-week summer segment selected for approximate stationarity
- Validation: the following weeks right after training
- Tests: (1) near training period, (2) a winter week, (3) a long later segment with more variation/trend

## Methods

### Part A — Baseline ARMA (temperature only)
- Identified strong daily periodicity (period ≈ 24), applied seasonal differencing, then fit ARMA and validated via residual diagnostics. 

### Part B — Box–Jenkins / ARMAX (with external input)
- Modeled the **input (net radiation)** with its own ARMA structure (after seasonal differencing). :contentReference[oaicite:8]{index=8}  
- Performed **cross-correlation analysis (CCF)** between prewhitened input/output residuals to specify the ARMAX transfer function. :contentReference[oaicite:9]{index=9}  
- Re-estimated the integrated Box–Jenkins model and evaluated **k-step predictions** (k = 1, 3, 18). :contentReference[oaicite:10]{index=10}

### Part C — Recursive predictor (Kalman filter)
- Converted the ARMAX model into a **state-space** form and used **Kalman filtering** to update parameter estimates recursively over time. :contentReference[oaicite:11]{index=11}

## Results (normalized prediction error variance)
Performance is reported using **normalized variance** of the k-step prediction residuals (lower is better), compared to a **naïve predictor**. :contentReference[oaicite:12]{index=12}

### Box–Jenkins (ARMAX) vs naïve — Test set 1 (closest to training period)
| Horizon | Naïve | ARMAX (BJ) | Relative reduction |
|---:|---:|---:|---:|
| 1-step | 0.0958 | 0.0610 | **36%** |
| 3-step | 0.5972 | 0.3208 | **46%** |
| 18-step | 0.7697 | 0.6602 | **14%** | :contentReference[oaicite:13]{index=13}

### Generalization across seasons/segments (ARMAX vs naïve)
The model also improved performance on a winter test week and on a later long segment, though accuracy depends on how stable the periodic pattern is. :contentReference[oaicite:14]{index=14}


